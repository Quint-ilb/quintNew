//
//  TapExercise.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation


struct TapExercise {
    var name: String
    var notes: [Note]
    var progress: Double = 0.0
    var isLocked: Bool = true
    var bpms: [Int]
    var info: [PopUpInfo]
    var category: ExerciseCategory
    var reward : Reward?
}

enum ExerciseCategory : String {
    case rhythm = "rhythm"
    case pitch = "pitch"
}

