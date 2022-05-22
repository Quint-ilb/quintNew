//
//  TapExerciseView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

enum TapButtonState: String {
    case start = "Start"
    case tap = "Tap"
    case ready = "Ready"
    case restart = "Restart"
}

enum TapIndicatorState {
    case right
    case wrong
    case neutral
}

struct TapExerciseView: View {
    
    @Environment(\.presentationMode) var presentation
    
    
    var tapExercise: TapExercise
    var generatedBlock : [[Int]]
    var totalTime : TimeInterval
    var bpm : Int
    @Binding var bpmIndex : Int
    @ObservedObject var playerManager : PlayerManager
    var onNext: () -> ()
    @State var x : CGFloat
    
    @State var tapTimestamp: [TimeInterval] = []
    @State var tapTimestampBool: [Bool] = []
    
    @State var tapIndicatorState: TapIndicatorState = .neutral {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                if tapIndicatorState != .neutral {
                    tapIndicatorState = .neutral
                }
            }
        }
    }
    
    @State var finishedBpm : Int = 0
    @StateObject var coachmarkManager: CoachmarkManager = CoachmarkManager(type: .tap)
    
    @State var isShowPopUpInfo : Bool = true
    
    var body: some View {
        ZStack{
            
            VStack{
                LevelView(totalDone: bpmIndex)
                    .padding(.bottom, 38)
                
                HStack{
                    Text("\(bpm) BPM")
                    //                    .padding(.leading, 36)
                    
                }.padding(.bottom, 50)
                
                NotesView(notes: tapExercise.notes,
                          playerManager: playerManager,
                          generatedBlock: generatedBlock,
                          totalTime: totalTime,
                          onStart: onStart,
                          x: $x,
                          coachmarkManager: coachmarkManager,
                          onTap: onTapButton,
                          tapIndicatorState: $tapIndicatorState
                ).onDisappear{
                    playerManager.enabled = false
                }
                
                Spacer()
                
//                Group{
//                    Text("index \(playerManager.playingIndex)")
//                    Text("timestamp \(playerManager.playingTimestamp)")
//                    Text("starttime \(playerManager.startTime)")
//                    Text("endTime \(playerManager.endTime ?? 0)")
//                    Text("timestamp \(playerManager.playingTimestamp < 0 ? "start" : "tap")")
//                }
//                HStack{
//                    
//                    ForEach(tapTimestampBool, id: \.self) { res in
//                        Circle()
//                            .frame(width: 5, height: 5)
//                            .foregroundColor(res == true ? .green : .red)
//                        
//                    }
//                }
            }.padding(.top, 150)
            
            
            if !playerManager.isPlaying && playerManager.startTime > 0 {
                let popUpState = getPopupState(isSuccess: getIsSuccess(), bpmIndex: bpmIndex)
                PopUpChallengeContentView(data: popUpState).myCustomPopUp(onTapoutside: {
                    playerManager.cleanToRestart()
                })
            }
            
            if isShowPopUpInfo {
                PopUpInfoContentView(data: tapExercise.info, onTapClose: {
                    isShowPopUpInfo.toggle()
                }).myCustomPopUp(onTapoutside: {
                    isShowPopUpInfo.toggle()
                })
            }
            
            
        }.ignoresSafeArea()
            .navigationBarTitle(tapExercise.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showPopUpInfo()
                                    }) {
                                        
                                        Image("info")
                                            .frame(width: 25.35, height: 20)
                                            
                                    }
            )
    }
    
    func showPopUpInfo() {
        isShowPopUpInfo = true
    }
    
    func getPopupState(isSuccess: Bool, bpmIndex: Int) -> PopUpState {
        if bpmIndex < 2 {
            if isSuccess {
                return .successDefault(onPressPrimary: {
                    goToNextLevel()
                }, onPressSecondary: {})
            }else {
                return .failedDefault(onPressPrimary: {
                    playerManager.cleanToRestart()
                }, onPressSecondary: {
                    presentation.wrappedValue.dismiss()
                })
            }
        }else {
            if isSuccess {
                return .successReward(reward: tapExercise.reward!, onPressPrimary: {
                    UserDefaults.standard.set(tapExercise.reward?.level, forKey: "exercise-\(tapExercise.category.rawValue)")
                    presentation.wrappedValue.dismiss()
                }, onPressSecondary: {})
            } else {
                return .failedReward(reward: tapExercise.reward!, onPressPrimary: {
                    playerManager.cleanToRestart()
                }, onPressSecondary: {
                    presentation.wrappedValue.dismiss()
                })
            }
        }
    }
    
    
    func goToNextLevel() {
        onNext()
        if bpmIndex <= 2 {
            playerManager.reInit(notes: tapExercise.notes, bpm: tapExercise.bpms[bpmIndex], offsetBpm: Config.OFFSET_BPM)
        }
    }
    
    func getIsSuccess() -> Bool {
        let totalOk = tapExercise.notes.filter { $0.isRest != true }.count
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
    
    func onTapButton(_ tapTime: TimeInterval) {
        //        let tapTime = playerManager.displayLink.timestamp
        guard playerManager.isPlaying else { return }
        tapTimestamp.append(tapTime)
        getIsOK(tapTime: tapTime)
    };
    
    func getIsOK(tapTime: TimeInterval) {
        let playingIndex = playerManager.playingIndex //0,1,2,  3, 4 //.,.,., 0,1
        let currentTime = playerManager.playTime[playingIndex]
        let isRest = playingIndex > Config.OFFSET_BPM-1 && tapExercise.notes[playingIndex - Config.OFFSET_BPM].isRest
        if abs(tapTime - currentTime) < 0.3 && !isRest && playingIndex > Config.OFFSET_BPM-1 {
            tapIndicatorState = .right
            tapTimestampBool.append(true)
        }else {
            tapIndicatorState = .wrong
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
    @Binding var x: CGFloat
    @ObservedObject var coachmarkManager: CoachmarkManager
    
    var onTap: (_ tapTime: TimeInterval) -> ()
    @Binding var tapIndicatorState : TapIndicatorState
    
    var blockWidth = CGFloat(Config.BLOCK_WIDTH)
    
    @State var isPressed : Bool = false
    @State var buttonLabel : TapButtonState = .start
    
    @State var indicatorFrame : CGRect?
    @State var indicatorSize : CGSize?
    
    
    var coachmarkStepIndex : Int = 0
    
    var body: some View {
        
        ZStack{
            let isShowIndicatorCm = coachmarkManager.coachmarkIndex == 0
            let isShowMetronomeCm = coachmarkManager.coachmarkIndex == 1
            let isShowIndicatorColorGreenCm = coachmarkManager.coachmarkIndex == 3
            let isShowIndicatorColorRedCm = coachmarkManager.coachmarkIndex == 2
            let shadowColor : Color = isShowIndicatorCm ? .white : isShowIndicatorColorGreenCm ? .green : isShowIndicatorColorRedCm ? .red : .clear
            let foregroundColor: Color = isShowIndicatorCm ? .blue : isShowIndicatorColorGreenCm ? .green : isShowIndicatorColorRedCm ? .red : tapIndicatorState == .right ? .green : tapIndicatorState == .wrong ? .red : .blue
            Rectangle()
                .frame(width: blockWidth, height: 50, alignment: .center)
                .foregroundColor(foregroundColor)
                .offset(x: 0, y: 0)
                .opacity(0.3)
                .shadow(color: shadowColor, radius: 10)
                .shadow(color: shadowColor, radius: 10)
                .shadow(color: shadowColor, radius: 10)
                .background(reader(isShowCoachmark: isShowIndicatorCm || isShowIndicatorColorGreenCm || isShowIndicatorColorRedCm, type: .tap, coachmarkManager: coachmarkManager))
                .zIndex(isShowIndicatorCm || isShowIndicatorColorGreenCm || isShowIndicatorColorRedCm ? 1 : 0)
            Rectangle()
                .frame(width: 1, height: 50, alignment: .center)
                .foregroundColor(.black)
                .offset(x: 0, y: 0)
            
            VStack{
                HStack(spacing: 0){
                    ForEach(Array(generatedBlock.enumerated()), id: \.offset) { (idx, block) in
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
                                    if idx == 0 {
                                        Circle()
                                            .frame(width: 7, height: 7)
                                            .foregroundColor(.secondaryLightColor)
                                            .shadow(color: .white.opacity(isShowMetronomeCm ? 1 : 0), radius: 10)
                                            .shadow(color: .white.opacity(isShowMetronomeCm ? 1 : 0), radius: 10)
                                            .shadow(color: .white.opacity(isShowMetronomeCm ? 1 : 0), radius: 10)
                                            .background(reader(isShowCoachmark: isShowMetronomeCm, type: .tap, coachmarkManager: coachmarkManager))
                                            .zIndex(isShowMetronomeCm ? 1 : 0)
                                    } else {
                                        Circle()
                                            .frame(width: 7, height: 7)
                                            .foregroundColor(.secondaryLightColor)
                                    }
                                    
                                }
                            }
                            .offset(x: -10, y: 0)
                            .frame(width: 20, height: 50, alignment: .center)
                            Spacer()
                        }
                        .frame(width: blockWidth, height: 50)
                        .padding(0)
                                                .border(.red)
                    }
                }.offset(x: x, y: 0)
                
            }.zIndex(isShowMetronomeCm || isShowIndicatorCm ? 1 : 0)
            
            //side
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
                
                
            }
            .frame(width: UIScreen.main.bounds.width
                   , height: 70)
            
        }.zIndex(1)
        
        Spacer()
        
        ButtonTap(playerManager: playerManager, onTap: { buttonState, tapTimestamp in
            if buttonState == .start || buttonState == .restart {
               
                if(x < 0) {
                    x *= -1
                }
                withAnimation(.linear(duration: totalTime).delay(0.8) ){
                    x = -1 * x
                }
                
                onStart()
            } else if buttonState == .tap {
                onTap(tapTimestamp)
            }
        })
        
//        if (playerManager.isPlaying && playerManager.startTime != -1 ){
//            DispatchQueue.main.asyncAfter(deadline: playerManager.startTime){
//                withAnimation(.linear(duration: totalTime)){
//                                    x = -1 * x
//                                }
//            }
            
//        }
        
    }
    
    
}

func reader(isShowCoachmark: Bool, type: CoachmarkType, coachmarkManager: CoachmarkManager) -> some View {
    return GeometryReader { (geometry) -> AnyView in
        AnyView(TapExerciseCoachmark(_frame: geometry.frame(in: CoordinateSpace.global), _size: geometry.size, coachMarkManager: coachmarkManager, isShowCoachmark: isShowCoachmark))
    }
    
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct TapExerciseCoachmark: View {
    var _frame : CGRect
    var _size : CGSize
    @ObservedObject var coachMarkManager: CoachmarkManager
    var isShowCoachmark: Bool
    
    @State var coachmarkHeight: CGFloat = 0
    
    var body: some View {
        if isShowCoachmark {
            ZStack(alignment: .top){
                Rectangle()
                    .fill(Color.black)
                    .opacity(0.35)
                    .onTapGesture {
                        coachMarkManager.nextCoachmark()
                    }
                
                VStack{
                    let coachmark = coachMarkManager.coachmarkData[coachMarkManager.coachmarkIndex]
                    VStack{
                        Triangle()
                            .fill(.white)
                            .frame(width: 27, height: 18)
                            .padding(0)
                            .offset(x: 0, y: 10)
                        VStack(spacing: 0){
                            Text("\(coachmark.description)")
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 32)
                        .frame(width: 321)
                        .background(.white)
                        .cornerRadius(24)
                    }.background(
                        GeometryReader { proxy in
                            Color.clear
                                .onAppear { /// 2.
                                    coachmarkHeight = proxy.size.height
                                }
                        }
                    )
                }
                .position(x: _frame.midX, y: _frame.midY + (coachmarkHeight/2) + (_size.height/2) + 5 )
            }.offset(x: _frame.midX * -1 + (_size.width/2), y: _frame.midY * -1 + (_size.height/2))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        } else {
            Rectangle().fill(Color.clear)
        }
    }
}

struct ButtonTap: View {
    @ObservedObject var playerManager : PlayerManager
    var onTap: (_ buttonState: TapButtonState, _ tapTimestamp: TimeInterval) -> ()
    
    var body: some View {
        //        Text("\(buttonState == .tap ? "tap" : "start")")
        let buttonState : TapButtonState = getButtonState()
        Button(action: {
            onTap(buttonState, playerManager.displayLink.timestamp)
        }, label: {
            TapButtonView(buttonState: buttonState, radius: 50)
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


//struct TapExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        TapExerciseView(tapExercise: Config.tapExercises[3], generatedBlock: Helper.generateBlock(offsetBpm: Config.OFFSET_BPM, notes: Config.tapExercises[3].notes), totalTime: Helper.getTotalTime(notes: Config.tapExercises[3].notes, bpm: Config.tapExercises[3].bpms[0], offsetBpm: Config.OFFSET_BPM), bpm: Config.tapExercises[3].bpms[0],
//                        playerManager: PlayerManager(notes: Config.tapExercises[3].notes, bpm: Config.tapExercises[3].bpms[0], offsetBpm: Config.OFFSET_BPM), onNext: {})
//    }
//}
