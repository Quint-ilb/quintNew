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
            notes: [.fullNote, .fullRest, .fullNote, .fullRest, .fullNote, .fullRest, .fullNote, .fullRest],
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
    
    static var tapExercises2 : [TapExercise] = [
        TapExercise(
            name: "C",
            notes: [.quarterNote(.C),
                    .quarterNote(.D),
                    .quarterNote(.E),
                    .quarterNote(.F),
                    .quarterNote(.G),
                    .quarterNote(.A),
                    .quarterNote(.B),
                    .quarterNote(.C5),
                    .fullRest,
                    .quarterNote(.C5),
                    .quarterNote(.B),
                    .quarterNote(.A),
                    .quarterNote(.G),
                    .quarterNote(.F),
                    .quarterNote(.E),
                    .quarterNote(.D),
                    .quarterNote(.C),
                   ],
            bpms: [60,80, 100],
            info: [],
            category: .pitch,
            reward: .finish
            ),
//        TapExercise(
//            name: "D",
//            notes: [],
//            bpms: [60,80, 100],
//            info: [],
//            category: .pitch,
//            reward: .finish
//            ),
//        TapExercise(
//            name: "E",
//            notes: [],
//            bpms: [60,80, 100],
//            info: [],
//            category: .pitch,
//            reward: .finish
//            ),
//        TapExercise(
//            name: "F",
//            notes: [],
//            bpms: [60,80, 100],
//            info: [],
//            category: .pitch,
//            reward: .finish
//            ),
//        TapExercise(
//            name: "G",
//            notes: [],
//            bpms: [60,80, 100],
//            info: [],
//            category: .pitch,
//            reward: .finish
//            ),
//        TapExercise(
//            name: "A",
//            notes: [],
//            bpms: [60,80, 100],
//            info: [],
//            category: .pitch,
//            reward: .finish
//            ),
//        TapExercise(
//            name: "B",
//            notes: [],
//            bpms: [60,80, 100],
//            info: [],
//            category: .pitch,
//            reward: .finish
//            )
        ]

    
    static var tapExercises3 : [TapExercise] = [
        TapExercise(
            name: "Twinkle Twinkle Little Star",
            notes: [
                .quarterNote(.C),
                .quarterNote(.C),
                .quarterNote(.G),
                .quarterNote(.G),
                .quarterNote(.A),
                .quarterNote(.A),
                .quarterNote(.G),
                .quarterRest,
                .quarterNote(.F),
                .quarterNote(.F),
                .quarterNote(.E),
                .quarterNote(.E),
                .quarterNote(.D),
                .quarterNote(.D),
                .quarterNote(.C),
                .quarterRest,
                .quarterNote(.G),
                .quarterNote(.G),
                .quarterNote(.F),
                .quarterNote(.F),
                .quarterNote(.E),
                .quarterNote(.E),
                .quarterNote(.D),
                .quarterRest,
                .quarterNote(.G),
                .quarterNote(.G),
                .quarterNote(.F),
                .quarterNote(.F),
                .quarterNote(.E),
                .quarterNote(.E),
                .quarterNote(.D),
                .quarterRest,
                .quarterNote(.C),
                .quarterNote(.C),
                .quarterNote(.G),
                .quarterNote(.G),
                .quarterNote(.A),
                .quarterNote(.A),
                .quarterNote(.G),
                .quarterRest,
                .quarterNote(.F),
                .quarterNote(.F),
                .quarterNote(.E),
                .quarterNote(.E),
                .quarterNote(.D),
                .quarterNote(.D),
                .quarterNote(.C),
                .quarterRest,
            ],
            bpms: [60,80, 100],
            info: [],
            category: .pitch,
            reward: .level3
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
    
    static var Sounds : [Sound] = [
        .C,
        //            .C_ ,
        .D,
        //            .D_,
        .E,
        .F,
        //            .F_,
        .G,
        //            .G_,
        .A,
        //            .A_ ,
        .B
    ]
    
}

