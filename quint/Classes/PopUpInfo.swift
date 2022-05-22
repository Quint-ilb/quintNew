//
//  PopUpInfo.swift
//  quint
//
//  Created by Widya Limarto on 21/05/22.
//

import Foundation


struct PopUpInfo {
    var image: String
    var title: String
    var description: String
    
    static var fullNote = PopUpInfo(image: "fullNoteInfo", title: "Semibreve\n(Whole Note)", description: "It's like a small oval shaped zero or letter O which is a good way to think of it when you first begin writing music.\n\nWe call this oval-shaped part of a note ‘the note head’.\n\nA semibreve has a value of four beats.\nThat means when we play a semibreve we count to four whilst holding the note.")
    
    static var fullRest = PopUpInfo(image: "fullRestInfo", title: "Semibreve Rest\n(Whole Rest)", description: "A semibreve rest (or whole note rest) is drawn as a small rectangle that hangs off the 2nd line from the top of the stave.\n\nIt has a value of four beats, the same as a semibreve note.")
    
    static var halfNote = PopUpInfo(image: "halfNoteInfo", title: "Minim\n(Half Note)", description: "It's similar to a semibreve but has a line coming out of the right-hand side of its note head.\n\nThis line is called a stem.\n\nThe stem halves the value of the note and so a minim has a value of two beats.\nThat means that we count to two when playing a minim, half as long as a somibreve.")
    
    static var halfRest = PopUpInfo(image: "halfRestInfo", title: "Minim Rest\n(Half Rest)", description: "The minim rest is a small rectangle that is very similar to the semibreve rest but, instead of hanging from the second line it sits on the middle line of the stave.\n\nIt has a value of two beats, the same as a minim note.")
    
    static var quarterNote = PopUpInfo(image: "quarterNoteInfo", title: "Crotchet\n(Quarter Note)", description: "It's like a minim, but its note head filled in black.\n\nCrotchet has a value of one heat that covers quarter of 4-opat measure.")
    
    static var quarterRest = PopUpInfo(image: "quarterRestInfo", title: "Crotchet Rest\n(Quarter Rest)", description: "The crotchet rest (or quarter note rest) is quite complicated to draw.\n\nIt has a value of one beat, the same as a crotchet note")
    
    static var eighthNote = PopUpInfo(image: "eighthNoteInfo", title: "Quaver\n(Eighth Note)", description: "It's like a crotchet but, It also has a tail coming out of the side of its stem\nThe note tail is also referred to as a flag or a hook.\n\nThe tail halves the value of the note again and so a quaver has a value of half a beat, half as long as  a crotchet.")
    
    static var eighthRest = PopUpInfo(image: "eighthRestInfo", title: "Quaver Rest\n(Eighth Rest)", description: "quaver rest which looks like a small number seven with a little blob on the end.\nIt has a value of ½ of a beat, the same as a quaver note.")
}
