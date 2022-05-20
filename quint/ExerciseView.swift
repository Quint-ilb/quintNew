//
//  ExerciseView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

struct ExerciseView: View {
    
    var exercise: TapExercise = Config.tapExercises[3]
    
    var body: some View {
        TapExerciseView(tapExercise: exercise,
                        
                        generatedBlock: Helper.generateBlock(offsetBpm: Config.OFFSET_BPM, notes: exercise.notes),
                        
                        totalTime: Helper.getTotalTime(notes: exercise.notes, bpm: exercise.bpms[0], offsetBpm: Config.OFFSET_BPM),
                        
                        bpm: exercise.bpms[0],
                        
                        playerManager: PlayerManager(notes: exercise.notes, bpm: exercise.bpms[0], offsetBpm: Config.OFFSET_BPM)
                        
                        )
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercise: Config.tapExercises[3])
    }
}
