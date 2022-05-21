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
            notes: [.fullNote, .fullRest, .fullNote, .fullRest, .fullNote, .fullRest, .fullNote, .fullRest,],
            bpms: [60,80,120],
            info: [.fullNote, .fullRest],
            category: .rhythm,
            reward: .level1
        ),
        TapExercise(
            name: "Half Note",
            notes: [.halfNote, .halfRest, .halfNote, .halfRest, .halfNote, .halfNote, .halfNote, .halfRest, .halfNote, .halfRest, .halfNote, .halfRest, .halfNote, .halfNote, .halfNote, .halfRest,],
            bpms: [60,80,120],
            info: [.halfNote, .halfRest],
            category: .rhythm,
            reward: .level2
        ),
        TapExercise(
            name: "Quarter Note",
            notes: [.quarterNote, .quarterRest, .quarterNote, .quarterRest, .quarterRest, .quarterRest, .quarterRest, .quarterRest, .quarterNote, .quarterRest, .quarterNote, .quarterRest, .quarterRest, .quarterRest, .quarterRest, .quarterRest],
            bpms: [60,80, 100],
            info: [.quarterNote, .quarterRest],
            category: .rhythm,
            reward: .level3
        ),
        TapExercise(
            name: "Eighth Note",
            notes: [.quarterNote, .quarterRest, .quarterNote, .quarterRest, .quarterNote, .eighthNote, .quarterNote, .eighthRest],
            bpms: [120,120
                   ,120],
            info: [.eighthNote, .eighthRest],
            category: .rhythm,
            reward: .level4
        )
        
    ]
    
    static var OFFSET_BPM = 3
    static var BLOCK_WIDTH = 50
        
    static var coachmarkData : [CoachmarkType : [Coachmark]] = [
        .tap : [
            Coachmark(description: "The box indicates the note being played. Tap when the note is exaclty in the box."),
            Coachmark(description: "The dot represents the beat, have sounds like a metronome."),
//            Coachmark(description: "This information contains a brief description of the material, to understand the material further, please click information."),
            Coachmark(description: "The red box indicates that you press the wrong note or rest note."),
            Coachmark(description: "The green box indicates that you already press correct note. ")
        ]
    ]
    
    static var Rewards : [Reward] = [.level1, .level2, .level3, .level4, .finish]
    
    
}

