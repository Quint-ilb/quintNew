//
//  ExerciseView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

struct ExerciseView: View {
    
    
    var exercise: TapExercise
    @StateObject var playerManager : PlayerManager
    @State var bpmIndex : Int = 0
    
    var body: some View {
        let generatedBlock = Helper.generateBlock(offsetBpm: Config.OFFSET_BPM, notes: exercise.notes)
        if(exercise.category == .rhythm) {
            TapExerciseView(
                tapExercise: exercise,
                            
                            generatedBlock: generatedBlock,
                            
                            totalTime: Helper.getTotalTime(notes: exercise.notes, bpm: exercise.bpms[bpmIndex], offsetBpm: Config.OFFSET_BPM),
                            
                            bpm: exercise.bpms[bpmIndex],
                            
                            bpmIndex : $bpmIndex,
                            
                            playerManager: playerManager,
                            
                            onNext: onPressNext,
                            x: Helper.getXInitialOffset(generatedBlock: generatedBlock)
            )
        } else if (exercise.category == .pitch) {
            PitchExerciseView(
                tapExercise: exercise,
                            
                            generatedBlock: generatedBlock,
                            
                            totalTime: Helper.getTotalTime(notes: exercise.notes, bpm: exercise.bpms[bpmIndex], offsetBpm: Config.OFFSET_BPM),
                            
                            bpm: exercise.bpms[bpmIndex],
                            
                            bpmIndex : $bpmIndex,
                            
                            playerManager: playerManager,
                            
                            onNext: onPressNext,
                            x: Helper.getXInitialOffset(generatedBlock: generatedBlock)
            )
        }
            
            
            
        
    }
    
    
    
    func onPressNext() {
        if bpmIndex < 2 {
            bpmIndex += 1
        }
    }
}

//struct ExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseView(rootIsActive: false, exercise: Config.tapExercises[3])
//    }
//}
