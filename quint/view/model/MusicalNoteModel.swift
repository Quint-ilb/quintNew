//
//  MusicalNoteModel.swift
//  quint
//
//  Created by Zakki Mudhoffar on 19/05/22.
//

import Foundation
import SwiftUI

struct MusicalNote : Identifiable, Equatable {
    var id: String = UUID().uuidString
    var name: String
    var image: String
}

class MusicalNoteModel : Identifiable, ObservableObject{
    @Published var musicals : [MusicalNote] = [
        MusicalNote(name: "Rythm Introduction", image: "G"),
        MusicalNote(name: "Whole", image: "fullNote"),
        MusicalNote(name: "Half", image: "halfNote"),
        MusicalNote(name: "Quarter", image: "quarterNote"),
        MusicalNote(name: "Eight", image: "eighthNote")

        ]
}
