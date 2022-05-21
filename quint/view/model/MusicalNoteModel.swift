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
    var exercise: TapExercise?
    
}

class MusicalNoteModel {
    var musicals : [MusicalNote] = [
        MusicalNote(name: "Rythm Introduction", image: "G"),
        MusicalNote(name: "Whole", image: "fullNote", exercise: Config.tapExercises[0]),
        MusicalNote(name: "Half", image: "halfNote", exercise: Config.tapExercises[1]),
        MusicalNote(name: "Quarter", image: "quarterNote", exercise: Config.tapExercises[2]),
        MusicalNote(name: "Eight", image: "eighthNote", exercise: Config.tapExercises[3])

        ]
}
