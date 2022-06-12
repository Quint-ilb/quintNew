//
//  TapExerciseView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

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
    @State var tapTimestampResultDict : [Int:Bool] = [:]
    
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
                
                //                                Group{
                //                                    Text("index \(playerManager.playingIndex)")
                //                                    Text("timestamp \(playerManager.playingTimestamp)")
                //                                    Text("starttime \(playerManager.startTime)")
                //                                    Text("endTime \(playerManager.endTime ?? 0)")
                //                                    Text("timestamp \(playerManager.playingTimestamp < 0 ? "start" : "tap")")
                //                                }
                //
                //                                HStack{
                //
                //                                    ForEach(tapTimestampBool, id: \.self) { res in
                //                                        Circle()
                //                                            .frame(width: 5, height: 5)
                //                                            .foregroundColor(res == true ? .green : .red)
                //
                //                                    }
                //                                }
                
                NotesView(notes: tapExercise.notes,
                          playerManager: playerManager,
                          generatedBlock: generatedBlock,
                          totalTime: totalTime,
                          onStart: onStart,
                          x: $x,
                          totalX: x*2,
                          coachmarkManager: coachmarkManager,
                          onTap: onTapButton,
                          tapIndicatorState: $tapIndicatorState
                ).onDisappear{
                    playerManager.enabled = false
                }
                
                Spacer()
                
                
                
            }.padding(.top, 150)
            
            
            if !playerManager.isPlaying && playerManager.startTime > 0 {
                let popUpState = getPopupState(isSuccess: getIsSuccess(), bpmIndex: bpmIndex)
                PopUpChallengeContentView(data: popUpState).myCustomPopUp(onTapoutside: {
                    playerManager.cleanToRestart()
                })
            }
            
            if isShowPopUpInfo {
                PopUpInfoContentView(data: tapExercise.info).myCustomPopUp(onTapoutside: {
                    isShowPopUpInfo.toggle()
                }, withCloseBtn: true)
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
            ).onDisappear {
                
            }
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
                    let currentlevel = UserDefaults.standard.integer(forKey: "exercise-\(tapExercise.category.rawValue)") ?? 0
                    if currentlevel < tapExercise.reward!.level {
                        UserDefaults.standard.set(tapExercise.reward?.level, forKey: "exercise-\(tapExercise.category.rawValue)")
                    }
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
        if tapTimestampBool.count > 0 {
            return false
        } else {
            let totalOk = playerManager.playSound.count
            if tapTimestampResultDict.count == totalOk {
                return true
            } else {
                return false
            }
        }
    }
    
    func onStart() {
        tapTimestamp.removeAll()
        tapTimestampBool.removeAll()
        playerManager.enabled.toggle()
    };
    
    func onTapButton(_ tapTime: TimeInterval) {
        tapTimestamp.append(tapTime)
        getIsOK(tapTime: tapTime)
    };
    
    func getIsOK(tapTime: TimeInterval) {
        let currentIndex = playerManager.playingIndex
        let nextIndex = playerManager.playingIndex + 1
        
        if(currentIndex > -1) {
            if(abs(tapTime - playerManager.playTime[currentIndex]) < 0.3) {
                tapIndicatorState = .right
                tapTimestampResultDict[currentIndex] = true
                return;
            }
        }
        
        if nextIndex < playerManager.playTime.count {
            if(abs(tapTime - playerManager.playTime[nextIndex]) < 0.3) {
                tapIndicatorState = .right
                tapTimestampResultDict[nextIndex] = true
                return;
            }
        }
        
        tapIndicatorState = .wrong
        tapTimestampBool.append(false)
        return;
    };
}

struct NotesView: View {
    
    @State var notes: [Note]
    @ObservedObject var playerManager: PlayerManager
    var generatedBlock : [[Int]]
    var totalTime: TimeInterval
    var onStart: () -> ()
    @Binding var x: CGFloat
    @State var totalX: CGFloat
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
            let shadowColor : Color = isShowIndicatorCm || isShowIndicatorColorGreenCm || isShowIndicatorColorRedCm ? .white : .clear
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
                                        .frame(width: 30, height: 40, alignment: .bottom)
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
                        //                                                .border(.red)
                    }
                }.offset(x: countX(), y: 0)
                
            }.zIndex(isShowMetronomeCm || isShowIndicatorCm ? 1 : 0)
            
            //side
            HStack{
                Rectangle()
                    .frame(width: 40, height: 80, alignment: .center)
                    .overlay(Rectangle()
                        .fill(Color.blackColor).padding(.leading, 36))
                    .foregroundColor(Color.bgPrimary)
                Spacer()
                Rectangle()
                    .frame(width: 40, height: 80, alignment: .center)
                    .overlay(Rectangle()
                        .fill(Color.blackColor).padding(.trailing, 36))
                    .foregroundColor(Color.bgPrimary)
                
                
            }
            .frame(width: UIScreen.main.bounds.width
                   , height: 70)
            
        }.zIndex(1)
        
        Spacer()
        
        ButtonTapView(playerManager: playerManager, onTap: { buttonState, tapTimestamp in
            if buttonState == .start || buttonState == .restart {
                onStart()
            } else if buttonState == .tap {
                onTap(tapTimestamp)
            }
        })
    }
    
    func countX() -> CGFloat {
        let percentage = (playerManager.playingTimestamp - playerManager.startTime)/(totalTime)
        let _x = x - (totalX * (percentage <= 1 ? percentage : 1))
        return _x
    }
    
}
