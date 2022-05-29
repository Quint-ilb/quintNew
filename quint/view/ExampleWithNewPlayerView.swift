//
//  ExampleWithNewPlayerView.swift
//  MyNoteTrainer
//
//  Created by Gerson Janhuel on 28/05/22.
//

import SwiftUI

/*
 NOTES:
 This demo running 2 audio player node simultaneously
 jadi flexible metronome bisa dimatikan ato dihidupin.
 
 Audio player pake AVAudioEngine & AVAudioPlayerNode
 jadi temponya tidak menggunak Timer, tapi pake sample rate buffer, lebih akurat dan best practice saat bermain dengan audio.
 
 
 */
struct ExampleWithNewPlayerView: View {
    let bpm: Double = 60
    
    @State var metronome: Metronome? = nil
    @State var noteAudioPlayer: NoteAudioPlayer? = nil
    
    @State var buttonState : TapButtonState = .start
    
    var body: some View {
        VStack {
            Text("Testing Audio Player")
            
            Button(action: {
                buttonPressed()
            }, label: {
                
                Text(buttonState.rawValue)
            })
        }.onAppear {
            prepareAudio()
        }.onDisappear {
            deallocateAudio()
        }
    }
    
    func prepareAudio() {
        metronome = Metronome(mainClickFile: Bundle.main.url(forResource: "hihat", withExtension: "wav")!)
        
        let notesToPlay: [URL] = [
            Bundle.main.url(forResource: "C", withExtension: "wav")!,
            Bundle.main.url(forResource: "D", withExtension: "wav")!,
            Bundle.main.url(forResource: "E", withExtension: "wav")!,
            Bundle.main.url(forResource: "F", withExtension: "wav")!,
            Bundle.main.url(forResource: "G", withExtension: "wav")!,
            Bundle.main.url(forResource: "A", withExtension: "wav")!,
            Bundle.main.url(forResource: "B", withExtension: "wav")!,
            Bundle.main.url(forResource: "C5", withExtension: "wav")!,
        ]
        noteAudioPlayer = NoteAudioPlayer(notesToPlay: notesToPlay)
    }
    
    func deallocateAudio() {
        metronome?.stop()
        metronome = nil
        
        noteAudioPlayer?.stop()
        noteAudioPlayer = nil
    }
    
    func buttonPressed() {
        switch buttonState {
        case .start:
            metronome?.play(bpm: bpm)
            noteAudioPlayer?.play(bpm: bpm)
            buttonState = .stop
        case .stop:
            metronome?.stop()
            noteAudioPlayer?.stop()
            buttonState = .start
        default:
            print("do nothing")
        }
        
    }
}

struct ExampleWithNewPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleWithNewPlayerView()
    }
}
