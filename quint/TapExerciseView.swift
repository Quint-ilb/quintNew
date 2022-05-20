//
//  TapExerciseView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

enum TapButtonState {
    case start
    case tap
    case restart
}

struct TapExerciseView: View {
    
    var tapExercise: TapExercise
    var generatedBlock : [[Int]]
    @State var totalTime : TimeInterval
    @State var bpm : Int
    @StateObject var playerManager : PlayerManager
    
    
    @State var tapTimestamp: [TimeInterval] = []
    @State var tapTimestampBool: [Bool] = []
    
    
    var body: some View {
        VStack{
            HStack{
                Text("\(bpm) BPM")
                    .padding(.leading, 36)
                //                    .font(.custom("SF Pro Display", size: 14, weight: .subheadline))
                Spacer()
            }
            
            NotesView(notes: tapExercise.notes,
                      playerManager: playerManager,
                      generatedBlock: generatedBlock,
                      totalTime: totalTime,
                      onStart: onStart,
                      x: CGFloat(Config.BLOCK_WIDTH * generatedBlock.count / 2),
                      onTap: onTapButton
            )
            
            
            Spacer()
            Text("index \(playerManager.playingIndex)")
            Text("timestamp \(playerManager.playingTimestamp)")
            Text("starttime \(playerManager.startTime)")
            Text("endTime \(playerManager.endTime ?? 0)")
            Text("timestamp \(playerManager.playingTimestamp < 0 ? "start" : "tap")")
            
            HStack{
                ForEach(tapTimestampBool, id: \.self) { timeBool in
                    Circle()
                        .frame(width: 10, height: 10, alignment: .leading)
                        .foregroundColor(timeBool ? .blue : .red)
                }
            }.frame(width: 500, height: 30, alignment: .center)
            
            if(!playerManager.isPlaying && playerManager.startTime > 0) {
                Text("result \(getIsSuccess() ? "success" : "failed")")
            }
            
        }.padding(.top, 30)
    }
    
    func getIsSuccess() -> Bool {
        let totalOk = tapExercise.notes.filter { $0.isRest == true }.count
        let totalTapOk = tapTimestampBool.filter { $0 == true }.count
        if(totalOk == totalTapOk && tapTimestampBool.count == totalOk ) {
            return true
        } else {
            return false
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
    };
    
    func getIsOK(tapTime: TimeInterval) {
        let playingIndex = playerManager.playingIndex //0,1,2,  3, 4 //.,.,., 0,1
        let currentTime = playerManager.playTime[playingIndex]
        let isRest = playingIndex > Config.OFFSET_BPM-1 && tapExercise.notes[playingIndex - Config.OFFSET_BPM].isRest
        if abs(tapTime - currentTime) < 0.3 && !isRest && playingIndex > Config.OFFSET_BPM-1 {
            tapTimestampBool.append(true)
        }else {
            tapTimestampBool.append(false)
        }
    };
}

struct NotesView: View {
    
    @State var notes: [Note]
    @ObservedObject var playerManager: PlayerManager
    var generatedBlock : [[Int]]
    var totalTime: TimeInterval
    var onStart: () -> ()
    @State var x: CGFloat
    
    var onTap: () -> ()
    
    var blockWidth = CGFloat(Config.BLOCK_WIDTH)
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: blockWidth, height: 50, alignment: .center)
                .foregroundColor(.blue)
                .offset(x: 0, y: 0)
                .opacity(0.3)
            Rectangle()
                .frame(width: 1, height: 50, alignment: .center)
                .foregroundColor(.black)
                .offset(x: 0, y: 0)
            
            VStack{
                HStack(spacing: 0){
                    ForEach(generatedBlock, id: \.self) { block in
                        HStack{
                            VStack{
                                if(block.count == 2){
                                    let i = block[1] - 1
                                    Image(block[1] != 0 ? notes[i].image : "" )
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .frame(width: 20, height: 30, alignment: .bottom)
                                    //                                            .background(.red)
                                }
                                Spacer()
                                if(block[0] == 1) {
                                    Circle()
                                        .frame(width: 7, height: 7)
                                        .foregroundColor(.primaryColor)
                                }
                            }
                            .offset(x: -10, y: 0)
                            .frame(width: 20, height: 50, alignment: .center)
                            Spacer()
                        }
                        .frame(width: blockWidth, height: 50)
                        .padding(0)
                        //                        .border(.red)
                    }
                }.offset(x: x, y: 0)
                
            }
            //
            HStack{
                Rectangle()
                    .frame(width: 40, height: 80, alignment: .center)
                    .overlay(Rectangle()
                        .fill(Color.black).padding(.leading, 36))
                    .foregroundColor(.white)
                Spacer()
                Rectangle()
                    .frame(width: 40, height: 80, alignment: .center)
                    .overlay(Rectangle()
                        .fill(Color.black).padding(.trailing, 36))
                    .foregroundColor(.white)
                    .foregroundColor(.white)
                
                
            }
            .frame(width: UIScreen.main.bounds.width
                   , height: 70)
            
        }
        
        ButtonTap(playerManager: playerManager, onTap: { buttonState in
            print("debug, player manager", playerManager.startTime)
            if buttonState == .start || buttonState == .restart {
                if(x < 0) {
                    x *= -1
                }
                withAnimation(.linear(duration: totalTime).delay(0.75) ){
                    x = -1 * x
                }
                onStart()
            } else if buttonState == .tap {
                onTap()
            }
        })
        
    }
}

struct ButtonTap: View {
    @ObservedObject var playerManager : PlayerManager
    var onTap: (_ buttonState: TapButtonState) -> ()
    
    var body: some View {
        //        Text("\(buttonState == .tap ? "tap" : "start")")
        let buttonState : TapButtonState = playerManager.isPlaying && playerManager.playingTimestamp >= playerManager.startTime ? .tap : .start
        Button(getButtonCopy(state: buttonState), action: {
            onTap(buttonState)
        })
        .buttonStyle(TapButtonStyle())
    }
    
    func getButtonCopy(state: TapButtonState) -> String {
        switch(state) {
        case .start:
            return "Start"
        case .tap:
            return "Tap"
        case .restart:
            return "Retry"
        }
    }
}

struct TapButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 120, height: 120, alignment: .center)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [configuration.isPressed ? .gray : .grayFColor, .grayEColor]), startPoint: .top, endPoint: .bottom))
            .foregroundColor(.secondaryColor)
            .clipShape(Circle())
            .animation(.easeOut(duration: 0.05), value: configuration.isPressed)
        
    }
}

struct TapExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        TapExerciseView(tapExercise: Config.tapExercises[3], generatedBlock: Helper.generateBlock(offsetBpm: Config.OFFSET_BPM, notes: Config.tapExercises[3].notes), totalTime: Helper.getTotalTime(notes: Config.tapExercises[3].notes, bpm: Config.tapExercises[3].bpms[0], offsetBpm: Config.OFFSET_BPM), bpm: Config.tapExercises[3].bpms[0],
                        playerManager: PlayerManager(notes: Config.tapExercises[3].notes, bpm: Config.tapExercises[3].bpms[0], offsetBpm: Config.OFFSET_BPM))
    }
}
