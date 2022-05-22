//
//  MusicalNoteModel.swift
//  quint
//
//  Created by Zakki Mudhoffar on 19/05/22.
//

import Foundation
import SwiftUI

struct MusicalNote {
//    var id: String = UUID().uuidString
    var name: String
    var image: String
    var category: ExerciseCategory?
    var level: Int?
    var exercise: TapExercise?
    
}

class MusicalNoteModel {
    var musicals : [MusicalNote] = [
        MusicalNote(name: "Rythm Introduction", image: "G"),
        MusicalNote(name: "Whole", image: "fullNote", category: .rhythm, level: 1, exercise: Config.tapExercises[0]),
        MusicalNote(name: "Half", image: "halfNote", category: .rhythm, level: 2, exercise: Config.tapExercises[1]),
        MusicalNote(name: "Quarter", image: "quarterNote", category: .rhythm, level: 3, exercise: Config.tapExercises[2]),
        MusicalNote(name: "Eight", image: "eighthNote", category: .rhythm, level: 4, exercise: Config.tapExercises[3])

        ]
}
