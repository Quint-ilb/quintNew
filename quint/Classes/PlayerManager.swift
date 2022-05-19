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
    
    var startIndex : Int = 0
    var displayLink : CADisplayLink!
    
    init(notes: [Note], bpm: Int, offsetBpm: Int = 2){
        print("bpm", bpm)
        self.noteInterval = Helper.convertBeatToTimeInterval(notes: notes, bpm: bpm, offsetBpm: offsetBpm)
        print("note interval", noteInterval as Any)
        self.setPlayers(noteInterval: noteInterval!, offsetBpm: offsetBpm)
//        self.setMetronomePlayers()
        self.displayLink = CADisplayLink(
            target: self,
            selector: #selector(trackPlayIndex))
    }
    
    private func getHiHatPlayer() -> Player {
        return Player(fileName: "hihat", ext: "m4a")
    }
    
    private func getStartPlayer() -> Player {
        return Player(fileName: "sound", ext: "m4a")
    }
    
    private func setPlayers(noteInterval: [TimeInterval], offsetBpm: Int) {
        
        for (index,noteInv) in noteInterval.enumerated() {
            if(index == 0) {
                for _ in 0...offsetBpm {
                    var player = getHiHatPlayer()
                    player.setBeat(beat: TimeInterval(noteInv/Double(offsetBpm)))
                    player.delegate = self
                    players.append(player)
                }
            }else{
                var player = getStartPlayer()
                player.setBeat(beat: noteInv)
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
        for player in players {
            player.stop()
        }
        displayLink.invalidate()
        print("Stoping sound")
    }
    
    private func cleanToRestart() {
        startIndex = 0
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
        players[startIndex].play(atTime: startTime, delay: 0.0)
        
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
    
    func playNext(playAt: TimeInterval, finishAt: TimeInterval) {
        startIndex += 1
        if(startIndex < players.count) {
            players[startIndex].play(atTime: finishAt)
        }
        self.playTime.insert(playAt, at: 0)
        
        endTime = endTime ?? finishAt
    }
}
