//
//  Note.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation

struct Note {
    var name: String
    var image: String
    var beat: Beat
    
    static let fullNote = Note(name: "Full", image: "fullNote", beat: .full)
    static let halfNote = Note(name: "Half", image: "halfNote", beat: .half)
    static let quarterNote = Note(name: "Quarter", image: "quarterNote", beat: .quarter)
    static let eighthNote = Note(name: "Eighth", image: "eighthNote", beat: .eighth)
}
