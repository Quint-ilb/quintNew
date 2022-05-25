//
//  PitchExerciseView.swift
//  quint
//
//  Created by Widya Limarto on 22/05/22.
//

import SwiftUI

struct PitchExerciseView: View {
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
                
                NotesView2(notes: tapExercise.notes,
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
                
                                Group{
//                                    Text("index \(playerManager.playingIndex)")
//                                    Text("timestamp \(playerManager.playingTimestamp)")
//                                    Text("starttime \(playerManager.startTime)")
//                                    Text("endTime \(playerManager.endTime ?? 0)")
//                                    Text("timestamp \(playerManager.playingTimestamp < 0 ? "start" : "tap")")
                                }
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
            
            if isShowPopUpInfo && tapExercise.info.count > 0 {
                PopUpInfoContentView(data: tapExercise.info).myCustomPopUp(onTapoutside: {
                    isShowPopUpInfo.toggle()
                }, withCloseBtn: true)
            }
            
            
        }.ignoresSafeArea()
            .navigationBarTitle(tapExercise.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    tapExercise.info.count > 0 ?
                 Button(action: {
                    showPopUpInfo()
                }) {
                    
                    Image("info")
                        .frame(width: 25.35, height: 20)
                    
                } : nil
            
                                
            )
    }
    
    func showPopUpInfo() {
        isShowPopUpInfo = true
    }
    
    func getPopupState(isSuccess: Bool, bpmIndex: Int) -> PopUpState {
        if bpmIndex < 3 {
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
            let totalOk = tapExercise.notes.filter { $0.isRest != true }.count
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
    
    func onTapButton(_ buttonSound : Sound, _ tapTime: TimeInterval) {
        //        let tapTime = playerManager.displayLink.timestamp
//        guard playerManager.isPlaying else { return }
        tapTimestamp.append(tapTime)
        getIsOK(sound: buttonSound, tapTime: tapTime)
    };
    
    func getIsOK(sound: Sound, tapTime: TimeInterval) {
        let currentIndex = playerManager.playingIndex
        let nextIndex = playerManager.playingIndex + 1
        
        if(currentIndex > 0) {
            if(abs(tapTime - playerManager.playTime[currentIndex]) < 0.3) {
                let isRest = tapExercise.notes[currentIndex - 1].isRest
                let isRightSound = (tapExercise.notes[currentIndex - 1].sound == .C5 ? Sound.C.rawValue : tapExercise.notes[currentIndex - 1].sound.rawValue) == sound.rawValue
                if !isRest && isRightSound {
                    tapIndicatorState = .right
                    tapTimestampResultDict[currentIndex - 1] = true
                    return;
                }else {
                    tapIndicatorState = .wrong
                    tapTimestampBool.append(false)
                    return;
                }
            }
        }
        
        if nextIndex < playerManager.playTime.count {
            if(abs(tapTime - playerManager.playTime[nextIndex]) < 0.3) {
                let _isRest = tapExercise.notes[nextIndex - 1].isRest
                let _isRightSound = (tapExercise.notes[nextIndex - 1].sound == .C5 ? Sound.C.rawValue : tapExercise.notes[nextIndex - 1].sound.rawValue) == sound.rawValue
                if !_isRest && _isRightSound {
                    tapIndicatorState = .right
                    tapTimestampResultDict[nextIndex - 1] = true
                    return;
                }else {
                    tapIndicatorState = .wrong
                    tapTimestampBool.append(false)
                    return;
                }
            }
        }
//        let currentTime = playerManager.playTime[playingIndex]
//        let isRest = playingIndex > Config.OFFSET_BPM-1 && tapExercise.notes[playingIndex - Config.OFFSET_BPM].isRest
//        let isRightSound = playingIndex > Config.OFFSET_BPM-1 && ((tapExercise.notes[playingIndex - Config.OFFSET_BPM].sound == .C5 ? Sound.C.rawValue : tapExercise.notes[playingIndex - Config.OFFSET_BPM].sound.rawValue) == sound.rawValue)
//        if isRightSound && abs(tapTime - currentTime) < 0.3 && !isRest && playingIndex > Config.OFFSET_BPM-1 {
//            tapIndicatorState = .right
//            tapTimestampBool.append(true)
//        }else {
//            tapIndicatorState = .wrong
//            tapTimestampBool.append(false)
//        }
        
        tapIndicatorState = .wrong
        tapTimestampBool.append(false)
        return;
    };
}

struct NotesView2: View {
    
    @State var notes: [Note]
    @ObservedObject var playerManager: PlayerManager
    var generatedBlock : [[Int]]
    var totalTime: TimeInterval
    var onStart: () -> ()
    @Binding var x: CGFloat
    @State var totalX: CGFloat
    @ObservedObject var coachmarkManager: CoachmarkManager
    
    var onTap: (_ buttonSound : Sound,_ tapTime: TimeInterval) -> ()
    @Binding var tapIndicatorState : TapIndicatorState
    
    var blockWidth = CGFloat(Config.BLOCK_WIDTH)
    
    @State var isPressed : Bool = false
    @State var buttonLabel : TapButtonState = .start
    
    @State var indicatorFrame : CGRect?
    @State var indicatorSize : CGSize?
    
    
    var coachmarkStepIndex : Int = 0
    
    var body: some View {
        
        ZStack{
            VStack(spacing: 0){
                ForEach(0..<5){ i in
                    VStack(spacing: 0){
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 1, alignment: .center)
                            .foregroundColor(.black)
                            .offset(x: 0, y: 0)
                        if i < 4 {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width, height: 7, alignment: .center)
                                .foregroundColor(.white)
                                .offset(x: 0, y: 0)
                        }
                        
                    }
                    
                }
            }
            
            let isShowIndicatorCm = coachmarkManager.coachmarkIndex == 0
            let isShowMetronomeCm = coachmarkManager.coachmarkIndex == 1
            let isShowIndicatorColorGreenCm = coachmarkManager.coachmarkIndex == 3
            let isShowIndicatorColorRedCm = coachmarkManager.coachmarkIndex == 2
            let shadowColor : Color = isShowIndicatorCm || isShowIndicatorColorGreenCm || isShowIndicatorColorRedCm ? .white : .clear
            let foregroundColor: Color = isShowIndicatorCm ? .blue : isShowIndicatorColorGreenCm ? .green : isShowIndicatorColorRedCm ? .red : tapIndicatorState == .right ? .green : tapIndicatorState == .wrong ? .red : .blue
            Rectangle()
                .frame(width: blockWidth, height: 80, alignment: .center)
                .foregroundColor(foregroundColor)
                .offset(x: 0, y: 0)
                .opacity(0.3)
                .shadow(color: shadowColor, radius: 10)
                .shadow(color: shadowColor, radius: 10)
                .shadow(color: shadowColor, radius: 10)
                .background(reader(isShowCoachmark: isShowIndicatorCm || isShowIndicatorColorGreenCm || isShowIndicatorColorRedCm, type: .tap, coachmarkManager: coachmarkManager))
                .zIndex(isShowIndicatorCm || isShowIndicatorColorGreenCm || isShowIndicatorColorRedCm ? 1 : 0)
            Rectangle()
                .frame(width: 1, height: 80, alignment: .center)
                .foregroundColor(.black)
                .offset(x: 0, y: 0)
            
            VStack{
                HStack(spacing: 0){
                    ForEach(Array(generatedBlock.enumerated()), id: \.offset) { (idx, block) in
                        HStack{
                            VStack{
                                if(block.count == 2){
                                    let i = block[1] - 1
                                    VStack{
                                        if(block[1] != 0 ){
                                            ZStack(alignment: .bottom){
                                                if notes[i].sound == .C {
                                                    Rectangle()
                                                        .frame(width: 22, height: 1, alignment: .center)
                                                        .foregroundColor(.black)
                                                        .offset(x: 0, y: -4)
                                                }
                                                
                                                Image(block[1] != 0 ? notes[i].image : "" )
                                                    .resizable()
                                                    .aspectRatio(1, contentMode: .fit)
                                                    .frame(width: 35, height: 38, alignment: .bottom)
                                                //                                                    .background(.red)
                                                    .offset(y: notes[i].isRest ? Helper.getRestOffset(rest: notes[i]) :  Helper.getYOffset(sound: notes[i].sound))
                                            }
                                        }
                                        
                                        
                                    }.frame(height: 74, alignment: .bottom) //70, 66,
                                    //                                        .background(.yellow)
                                    //                                        .opacity(0.3)
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
                                            .frame(width: 7, height: 6.8)
                                            .foregroundColor(.secondaryLightColor)
                                    }
                                    
                                }
                            }
                            .offset(x: -10, y: 0)
                            .frame(width: 20, height: 88, alignment: .top)
                            //                            .background(.green)
                            Spacer()
                        }
                        .frame(width: blockWidth, height: 50)
                        .padding(0)
                        //                        .border(.red)
                    }
                }.offset(x: countX(), y: 0)
                
            }.zIndex(isShowMetronomeCm || isShowIndicatorCm ? 1 : 0)
            
            //side
            HStack{
                HStack{
                    Rectangle()
                        .frame(width: 40, height: 100, alignment: .center)
                        .overlay(Rectangle()
                            .fill(Color.black).padding(.leading, 36))
                        .foregroundColor(.white)
                    Image("g2")
                        .resizable()
                        .frame(width: 35, height: 70)
                }
                
                Spacer()
                Rectangle()
                    .frame(width: 40, height: 100, alignment: .center)
                    .overlay(Rectangle()
                        .fill(Color.black).padding(.trailing, 36))
                    .foregroundColor(.white)
                
                
            }
            .frame(width: UIScreen.main.bounds.width
                   , height: 70)
            
        }.zIndex(1)
        
        Spacer()
        
        let buttonState : TapButtonState = getButtonState()
        if buttonState == .tap {
            let data = convertArrofSoundsToCol(arr: Config.Sounds)
            VStack{
                ForEach(data, id: \.self) { _data in
                    HStack{
                        ForEach(0..<_data.count, id: \.self) { idx in
                            ButtonNoteTapView(playerManager: playerManager, sound: _data[idx], onTap: { buttonSound,tapTimestamp in
                                onTap(buttonSound, tapTimestamp)
                            })
                            if(idx != _data.count - 1){
                                Spacer()
                            }
                        }
                        
                        
                    }.frame(width: UIScreen.main.bounds.width - 80)
                }
            }
            
        } else {
            ButtonTapView(playerManager: playerManager, onTap: { buttonState, tapTimestamp in
                if buttonState == .start || buttonState == .restart {
                    onStart()
                }
            })
        }
        
        
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
    
    func countX() -> CGFloat {
        let percentage = (playerManager.playingTimestamp - playerManager.startTime)/(totalTime)
        let _x = x - (totalX * (percentage <= 1 ? percentage : 1))
        return _x
    }
    
    func convertArrofSoundsToCol(arr: [Sound]) -> [[Sound]] {
        let res : [[Sound]] = Helper.arrToColumn(data: arr, col: 3)
        return res
    }
    
    
}
