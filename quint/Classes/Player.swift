//
//  Player.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation
import AVFoundation

protocol PlayerDelegate {
    func playNext(playAt: TimeInterval, finishAt: TimeInterval)
}

struct Player {
    
    var audioPlayer : AVAudioPlayer?
    var beat: TimeInterval = TimeInterval(0)
    
    var delegate: PlayerDelegate?
    
    init(fileName: String, ext: String) {
        do{
            let soundURL = Bundle.main.url(forResource: fileName, withExtension: ext)!
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            // couldn't load file :(
        }
    }
    
    func prepareToPlay() {
        audioPlayer?.prepareToPlay()
    }
    
    func play(atTime: TimeInterval?, delay: TimeInterval = 0.0) {
        let play_at = atTime ?? audioPlayer!.deviceCurrentTime + delay
        print("play at", play_at)
        
        audioPlayer?.play(atTime: play_at)
        delegate?.playNext(playAt: play_at, finishAt: play_at + self.beat)
        
    }
    
    mutating func setBeat(beat: TimeInterval) {
        self.beat = beat
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func stop() {
        audioPlayer?.stop()
    }
    
}
