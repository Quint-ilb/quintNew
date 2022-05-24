//
//  Player.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation
import AVFoundation

protocol PlayerDelegate {
    func playNext(playAt: TimeInterval, finishAt: TimeInterval, playerType: PlayerType)
}

enum PlayerType {
    case note
    case metronome
}

struct Player {
    
    var audioPlayer : AVAudioPlayer?
    var beat: TimeInterval = TimeInterval(0)
    var playerType: PlayerType!
    
    var delegate: PlayerDelegate?
    
    init(fileName: String, ext: String, playerType: PlayerType) {
        do{
            let soundURL = Bundle.main.url(forResource: fileName, withExtension: ext)!
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            self.playerType = playerType
        } catch let error{
            print("init player failed", error.localizedDescription)
            // couldn't load file :(
        }
    }
    
    func prepareToPlay() {
        audioPlayer?.prepareToPlay()
    }
    
    func play(atTime: TimeInterval?, delay: TimeInterval = 0.0) {
        let play_at = atTime ?? audioPlayer!.deviceCurrentTime + delay
        print("play at", audioPlayer, play_at)
        
        audioPlayer?.play(atTime: play_at)
        delegate?.playNext(playAt: play_at, finishAt: play_at + self.beat, playerType: self.playerType)
        
    }
    
    mutating func setBeat(beat: TimeInterval) {
        self.beat = beat
    }
    
    func setVolume(vol: Int) {
        self.audioPlayer?.volume = Float(vol)
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func stop() {
        audioPlayer?.stop()
    }
    
    func setRate(rate: Float) {
        audioPlayer?.enableRate = true
        audioPlayer?.rate = rate
    }
}
