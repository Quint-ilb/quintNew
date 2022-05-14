//
//  TapExerciseView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

struct TapExerciseView: View {
    
    @StateObject var playerManager : PlayerManager = PlayerManager(notes: Lib.tapExercises[2].notes, bpm: Lib.tapExercises[2].bpms[0])
    
    @State var tapTimestamp: [TimeInterval] = []
    @State var tapTimestampBool: [Bool] = []
    
    init(){
        print("tap exercise init")
    }
    
    var body: some View {
        VStack{
            Button("start", action: {
                onStart()
            })
            
            Text("playingIndex \(playerManager.playingIndex)")
            Text("cadisplaylink \(playerManager.playingTimestamp)")
            Text("startTime \(playerManager.startTime)")
           
            HStack{
                ForEach(tapTimestampBool, id: \.self) { timeBool in
                    Circle()
                        .frame(width: 10, height: 10, alignment: .leading)
                        .foregroundColor(timeBool ? .blue : .red)
//                        .foregroundColor(getColor(time: time))
                }
            }.frame(width: 500, height: 30, alignment: .center)
            
            ButtonTap(onTap: onTapButton)
        }
        
        
    }
    
    func onStart() {
        tapTimestamp.removeAll()
        tapTimestampBool.removeAll()
        playerManager.enabled.toggle()
    };
 
    func onTapButton() {
        let tapTime = playerManager.displayLink.timestamp
        tapTimestamp.append(tapTime)
        getIsOK(tapTime: tapTime)
        print(tapTimestamp)
    };
    
    func getIsOK(tapTime: TimeInterval) {
        let currentTime = playerManager.playTime[playerManager.playingIndex]
        if abs(tapTime - currentTime) < 0.2 {
            tapTimestampBool.append(true)
        }else {
            tapTimestampBool.append(false)
        }
    };
}

struct ButtonTap: View {
    var onTap: () -> ()
    
    var body: some View {
        Button("tap here", action: {
            onTap()
        })
    }
}

struct TapExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        TapExerciseView()
    }
}

