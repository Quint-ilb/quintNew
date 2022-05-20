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
    
}
