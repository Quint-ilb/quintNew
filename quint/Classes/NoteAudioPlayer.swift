//
//  NoteAudioPlayer.swift
//  MyNoteTrainer
//
//  Created by Gerson Janhuel on 27/05/22.
//

import Foundation
import AVFoundation

class NoteAudioPlayer {
    private let audioEngine: AVAudioEngine
    private let notesPlayerNode: AVAudioPlayerNode
    private var notesAudioFiles = [AVAudioFile]()
    
    init(notesToPlay: [URL]) {
        notesAudioFiles = notesToPlay.map { try! AVAudioFile(forReading: $0) }
        
        notesPlayerNode = AVAudioPlayerNode()
        audioEngine = AVAudioEngine()
        audioEngine.attach(notesPlayerNode)
        
        audioEngine.connect(notesPlayerNode, to: audioEngine.mainMixerNode, format: notesAudioFiles[0].processingFormat)
    }
    
    private func generateBufferForNotes(bpm: Double, notes: [AVAudioFile]) -> AVAudioPCMBuffer {
        // get the frame size by BPM using first note as sample
        let beatLength = AVAudioFrameCount(notes[0].processingFormat.sampleRate * 60 / Double(bpm))
        
        var notesBufferPointerArray = [Float]()
        
        notesAudioFiles.forEach { noteAudioFile in
            noteAudioFile.framePosition = 0
            
            let noteBuffer = AVAudioPCMBuffer(pcmFormat: noteAudioFile.processingFormat, frameCapacity: beatLength)!
            try! noteAudioFile.read(into: noteBuffer)
            noteBuffer.frameLength = beatLength
            
            let channelCount = 1 //play mono
            
            let noteArray = Array(
                UnsafeBufferPointer(start: noteBuffer.floatChannelData![1],
                                    count: channelCount * Int(beatLength))
            )
            notesBufferPointerArray.append(contentsOf: noteArray)
        }
        
        let totalNotesUInt32 = UInt32(notesAudioFiles.count)
        let allNotesBuffer = AVAudioPCMBuffer(pcmFormat: notesAudioFiles[0].processingFormat,
                                                 frameCapacity: totalNotesUInt32 * beatLength)!
        allNotesBuffer.frameLength = totalNotesUInt32 * beatLength
        
        let channelCount = Int(notesAudioFiles[0].processingFormat.channelCount)
        allNotesBuffer.floatChannelData!.pointee.assign(from: notesBufferPointerArray, count: channelCount * Int(allNotesBuffer.frameLength))
        
        
        return allNotesBuffer
    }
    
    func play(bpm: Double) {
        if notesAudioFiles.count > 0 {
            notesPlayerNode.stop()
            try! audioEngine.start()
            // get notes buffer
            let notesBuffer = generateBufferForNotes(bpm: bpm, notes: notesAudioFiles)
            notesPlayerNode.scheduleBuffer(notesBuffer, at: nil, options: .interrupts, completionHandler: nil)
            notesPlayerNode.play()
        }
    }
    
    func stop() {
        notesPlayerNode.stop()
        audioEngine.stop()
        
    }
    
    deinit {
        print("notes player deallocated!")
        notesPlayerNode.stop()
        audioEngine.stop()
    }
}

