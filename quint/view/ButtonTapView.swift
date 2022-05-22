//
//  ButtonTapView.swift
//  quint
//
//  Created by Widya Limarto on 22/05/22.
//

import SwiftUI

struct ButtonTapView: View {
    @ObservedObject var playerManager : PlayerManager
    var onTap: (_ buttonState: TapButtonState, _ tapTimestamp: TimeInterval) -> ()
    
    var body: some View {
        //        Text("\(buttonState == .tap ? "tap" : "start")")
        let buttonState : TapButtonState = getButtonState()
        Button(action: {
            onTap(buttonState, playerManager.displayLink.timestamp)
        }, label: {
            TapButtonView(buttonLabel: buttonState.rawValue, radius: 50)
        })
    }
    
    func getButtonState() -> TapButtonState {
        if playerManager.playingTimestamp != -1 && playerManager.playingTimestamp >= playerManager.startTime && playerManager.playingTimestamp <= (playerManager.endTime ?? -1) {
            return .tap
        } else if playerManager.playingTimestamp > 0 && playerManager.playingTimestamp < playerManager.startTime {
            return .ready
        } else {
            return .start
        }
    }
}

struct ButtonNoteTapView: View {
    @ObservedObject var playerManager : PlayerManager
    var sound: Sound
    var onTap: (_ buttonSound: Sound, _ tapTimestamp: TimeInterval) -> ()
    
    var body: some View {
        Button(action: {
            onTap(sound, playerManager.displayLink.timestamp)
        }, label: {
            TapButtonView(buttonLabel: sound.rawValue, radius: 25)
        })
    }
    
}
