//
//  Note.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation

enum Sound: String {
    case C = "C"
    case C_ = "C#"
    case D = "D"
    case D_ = "D#"
    case E = "E"
    case F = "F"
    case F_ = "F#"
    case G = "G"
    case G_ = "G#"
    case A = "A"
    case A_ = "A#"
    case B = "B"
    case C5 = "C5"
    case sound = "sound"
    
}

struct Note: Equatable {
    
    var name: String
    var image: String
    var beat: Beat
    var sound: Sound = .D
    var isRest: Bool = false
    var level: Double = 3.0

    
    static let fullNote = Note(name: "Full", image: "fullNote", beat: .full)
    static let halfNote = Note(name: "Half", image: "halfNote", beat: .half)
    static let quarterNote = Note(name: "Quarter", image: "quarterNote", beat: .quarter)
    static let eighthNote = Note(name: "Eighth", image: "eighthNote", beat: .eighth)
    static let fullRest = Note(name: "FullRest", image: "fullRest", beat: .full, isRest: true)
    static let halfRest = Note(name: "HalfRest", image: "halfRest", beat: .half, isRest: true)
    static let quarterRest = Note(name: "QuarterRest", image: "quarterRest", beat: .quarter, isRest: true)
    static let eighthRest = Note(name: "EightRest", image: "eighthRest", beat: .eighth, isRest: true)
    
    static func fullNote(_ sound: Sound) -> Note { return Note(name: "Full", image: "fullNote", beat: .full, sound: sound) }
    static func halfNote(_ sound: Sound, isFlip: Bool = false) -> Note { return Note(name: "Half", image: isFlip ? "halfNote" : "halfNote", beat: .half, sound: sound) }
    static func quarterNote(_ sound: Sound, isFlip: Bool = false) -> Note { return Note(name: "Quarter", image: isFlip ? "quarterNote" : "quarterNote", beat: .quarter, sound: sound) }
    static func eighthNote(_ sound: Sound, isFlip: Bool = false) -> Note { return Note(name: "Eighth", image: isFlip ? "eighthNote" : "eighthNote", beat: .eighth, sound: sound) }
    
    
}


