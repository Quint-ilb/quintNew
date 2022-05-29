//
//  Metronome.swift
//  MyNoteTrainer
//
//  Created by Gerson Janhuel on 28/05/22.
//

import AVFoundation

class Metronome {
    private let audioEngine: AVAudioEngine
    private let metronomePlayerNode: AVAudioPlayerNode
    private let mainClickAudioFile: AVAudioFile
    
    init(mainClickFile: URL) {
        self.mainClickAudioFile = try! AVAudioFile(forReading: mainClickFile)
        
        metronomePlayerNode = AVAudioPlayerNode()
        
        audioEngine = AVAudioEngine()
        audioEngine.attach(metronomePlayerNode)
        
        audioEngine.connect(metronomePlayerNode, to: audioEngine.mainMixerNode, format: mainClickAudioFile.processingFormat)
    }
    
    // reference: https://stackoverflow.com/a/32818110
    private func generateBuffer(bpm: Double) -> AVAudioPCMBuffer {
        mainClickAudioFile.framePosition = 0
        
        let periodLength = AVAudioFrameCount(mainClickAudioFile.processingFormat.sampleRate * 60 / Double(bpm)) // tick's length for given bpm (sound length + silence length)
        let buffer = AVAudioPCMBuffer(pcmFormat: mainClickAudioFile.processingFormat, frameCapacity: periodLength)!
        try! mainClickAudioFile.read(into: buffer)
        buffer.frameLength = periodLength
        
        return buffer
        
    }
    
    func play(bpm: Double) {
        metronomePlayerNode.stop()
        try! audioEngine.start()
        
        // get metronome buffer
        let buffer = generateBuffer(bpm: bpm)
        metronomePlayerNode.scheduleBuffer(buffer, at: nil, options: .loops, completionHandler: nil)
        metronomePlayerNode.play()
    }
    
    func stop() {
        metronomePlayerNode.stop()
        audioEngine.stop()
        
    }
    
    deinit {
        print("Metronome deallocated!")
        metronomePlayerNode.stop()
        audioEngine.stop()
    }
}
