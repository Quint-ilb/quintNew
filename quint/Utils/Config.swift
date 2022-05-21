//
//  Config.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation

class Config {
    static var tapExercises : [TapExercise] = [
        TapExercise(
            name: "Full Note",
            notes: [.fullNote],
            bpms: [60,80,120]
        ),
        TapExercise(
            name: "Half Note",
            notes: [.halfNote, .halfNote],
            bpms: [60,80,120]
        ),
        TapExercise(
            name: "Quarter Note",
            notes: [.quarterNote, .quarterNote, .quarterNote, .quarterNote],
            
            bpms: [60,80, 100]
        ),
        TapExercise(
            name: "Eighth Note",
            notes: [.fullNote, .fullRest, .halfNote, .halfRest, .quarterNote, .quarterRest, .eighthNote, .eighthRest],
            bpms: [120,120
                   ,120]
        )
        
    ]
    
    static var OFFSET_BPM = 3
    static var BLOCK_WIDTH = 50
        
    static var coachmarkData : [CoachmarkType : [Coachmark]] = [
        .tap : [
            Coachmark(description: "The box indicates the note being played. Tap when the note is exaclty in the box."),
            Coachmark(description: "The dot represents the beat, have sounds like a metronome."),
            Coachmark(description: "This information contains a brief description of the material, to understand the material further, please click information."),
        ]
    ]
    
}
