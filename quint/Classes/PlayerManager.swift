//
//  PlayerManager.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation
import QuartzCore


class PlayerManager: ObservableObject, PlayerDelegate {
    
    var tolerance: TimeInterval = 0.125
    var players : [Player] = []
    var metronomePlayers : [Player] = []
    var noteInterval : [TimeInterval]?
    @Published var metronomeInterval : [TimeInterval]?
    
    var enabled: Bool = false { didSet {
        if enabled {
            start()
        } else {
            stop()
        }
    }}
    
    
//    @Published var startTime: DispatchTime = .distantFuture
    @Published var startTime : TimeInterval = -1
    @Published var playingIndex: Int = -1
    @Published var playingTimestamp : TimeInterval = -1
    @Published var playTime : [TimeInterval] = []
    @Published var endTime: TimeInterval?
    @Published var isPlaying : Bool = false
    
    var startIndex : Int = 0
    var metronomeStartIndex: Int = 0
    var displayLink : CADisplayLink!
    var notesToPlay : [Note]!
    
    init(notes: [Note], bpm: Int, offsetBpm: Int = Config.OFFSET_BPM){
        print("bpm", bpm)
        self.notesToPlay = notes
        self.noteInterval = Helper.convertBeatToTimeInterval(notes: notes, bpm: bpm, offsetBpm: offsetBpm)
        print("note interval", noteInterval as Any)
        self.metronomeInterval = Helper.getMetronomeBeatInterval(notes: notes, bpm: bpm, offsetBpm: offsetBpm)
        print("metronome interval", metronomeInterval as Any)
        self.setPlayers(noteInterval: noteInterval!, offsetBpm: offsetBpm, notes: notes)
        self.setMetronomePlayers(metronomeInterval: metronomeInterval!)
        self.displayLink = CADisplayLink(
            target: self,
            selector: #selector(trackPlayIndex))
    }
    
    func reInit(notes: [Note], bpm: Int, offsetBpm: Int = Config.OFFSET_BPM){
        print("bpm", bpm)
        self.noteInterval?.removeAll()
        self.noteInterval = Helper.convertBeatToTimeInterval(notes: notes, bpm: bpm, offsetBpm: offsetBpm)
        print("note interval", noteInterval as Any)
        self.metronomeInterval?.removeAll()
        self.metronomeInterval = Helper.getMetronomeBeatInterval(notes: notes, bpm: bpm, offsetBpm: offsetBpm)
        print("metronome interval", metronomeInterval as Any)
        self.players.removeAll()
        self.setPlayers(noteInterval: noteInterval!, offsetBpm: offsetBpm, notes: notes)
        self.metronomePlayers.removeAll()
        self.setMetronomePlayers(metronomeInterval: metronomeInterval!)
        self.displayLink = CADisplayLink(
            target: self,
            selector: #selector(trackPlayIndex))
        self.cleanToRestart()
    }
    
    private func getHiHatPlayer(playerType: PlayerType) -> Player {
        return Player(fileName: "hihat", ext: "wav", playerType: playerType)
    }
    
    private func getStartPlayer(playerType: PlayerType, sound: Sound) -> Player {
        return Player(fileName: sound.rawValue, ext: "wav", playerType: playerType)
    }
    
    private func setMetronomePlayers(metronomeInterval: [TimeInterval]) {
        for metronomeBeat in metronomeInterval {
            var player = getHiHatPlayer(playerType: .metronome)
            player.setBeat(beat: metronomeBeat)
            player.delegate = self
            metronomePlayers.append(player)
        }
    }
    
    private func setPlayers(noteInterval: [TimeInterval], offsetBpm: Int, notes: [Note]) {
        
        for (index,noteInv) in noteInterval.enumerated() {
            if(index == 0) {
                for _ in 0..<offsetBpm {
                    var player = getHiHatPlayer(playerType: .note)
                    player.setBeat(beat: TimeInterval(noteInv/Double(offsetBpm)))
                    player.delegate = self
                    players.append(player)
                }
            }else{
                var player = getStartPlayer(playerType: .note, sound: notesToPlay[index-1].sound)
                player.setBeat(beat: noteInv)
                if(notes[index-1].isRest) {
                    player.setVolume(vol: 0)
                }else {
                    player.setVolume(vol: 3)
                }
//                player.setRate(rate:0.649/Float(noteInv))
                player.delegate = self
                players.append(player)
            }
            
        }
    }

    private func start() {
        if playingIndex > -1 {
            cleanToRestart()
        }
        prepareToPlay()
//        startTime = DispatchTime.now()
        displayLink = CADisplayLink(target: self, selector: #selector(trackPlayIndex))
        displayLink.add(to: .main, forMode: .default)
//        print(displayLink.timestamp)
//        play()
    }
    
    private func stop() {
        isPlaying = false
        for player in players {
            player.stop()
        }
        for player in metronomePlayers {
            player.stop()
        }
        displayLink.invalidate()
        print("Stoping sound")
    }
    
    func cleanToRestart() {
        startIndex = 0
        metronomeStartIndex = 0
        playingIndex = -1
        playingTimestamp = -1
        playTime.removeAll()
        endTime = nil
        startTime = -1
    }
    
    private func prepareToPlay() {
        for player in players {
            player.prepareToPlay()
        }
    }
    
    private func play() {
        isPlaying = true
        players[startIndex].play(atTime: startTime, delay: 0.0)
//        print(metronomeStartIndex)
        metronomePlayers[metronomeStartIndex].play(atTime: startTime, delay: 0.0)
        
    }
    
    @objc private func trackPlayIndex(displayLink:CADisplayLink) {
        if startTime == -1 {
            startTime = displayLink.timestamp + 1.0
            play()
        }else {
            playingTimestamp = displayLink.timestamp
            if (playingIndex+1 < playTime.count) {
                if(abs(playingTimestamp - playTime[playingIndex+1]) < tolerance) {
                    playingIndex += 1
                    
                }
            }
            if(displayLink.timestamp > endTime! + 0.1) {
                self.enabled = false
            }
        }
        
    }
    
    func playNext(playAt: TimeInterval, finishAt: TimeInterval, playerType: PlayerType) {
        if playerType == .note {
            startIndex += 1
            if(startIndex < players.count) {
                players[startIndex].play(atTime: finishAt)
            }
            self.playTime.insert(playAt, at: 0)
            
            endTime = endTime ?? finishAt
        }else if playerType == .metronome {
            metronomeStartIndex += 1
            if(metronomeStartIndex < metronomePlayers.count) {
                metronomePlayers[metronomeStartIndex].play(atTime: finishAt)
            }
            endTime = endTime ?? finishAt
        }
        
    }
}
