//
//  ExerciseView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

struct ExerciseView: View {
    
    var exercise: TapExercise = Config.tapExercises[3]
    @State var bpmIndex : Int = 0
    
    var body: some View {
        TapExerciseView(tapExercise: exercise,
                        
                        generatedBlock: Helper.generateBlock(offsetBpm: Config.OFFSET_BPM, notes: exercise.notes),
                        
                        totalTime: Helper.getTotalTime(notes: exercise.notes, bpm: exercise.bpms[bpmIndex], offsetBpm: Config.OFFSET_BPM),
                        
                        bpm: exercise.bpms[bpmIndex],
                        bpmIndex : $bpmIndex,
                        
                        playerManager: PlayerManager(notes: exercise.notes, bpm: exercise.bpms[bpmIndex], offsetBpm: Config.OFFSET_BPM),
                        
                        onNext: onPressNext
                        
        )
    }
    
    func onPressNext() {
        if bpmIndex < 2 {
            bpmIndex += 1
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercise: Config.tapExercises[3])
    }
}
