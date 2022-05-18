//
//  Lib.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation

class Lib {
    static var tapExercises : [TapExercise] = [
        TapExercise(
            name: "Full Note",
            notes: [.fullNote, .fullRest, .fullNote, .fullRest],
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
            notes: [.eighthNote, .eighthNote, .eighthNote, .eighthNote, .eighthNote, .eighthNote, .eighthNote, .eighthNote],
            bpms: [40,60,80]
        )
        
    ]
}


