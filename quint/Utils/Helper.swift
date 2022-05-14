//
//  Helper.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation

class Helper {
    static func convertBeatToMs(notes: [Note], bpm: Int) -> [Int]{
        
        // bpm 60, beat 4 -> 4000ms
        // bpm 120, beat 4 -> 2000ms
        // bpm 50, beat 4 ->
        var beatsMs : [Int] = []
        for note in notes {
            beatsMs.append(Int( 60 * Int(note.beat.rawValue * 1000) / bpm ))
        }
        return beatsMs
    }
    
    static func convertBeatToTimeInterval(notes: [Note], bpm: Int, offsetBpm: Int? ) -> [TimeInterval]{
        //beat [1,1,1] -> timeinterval [0, 1, 1, 1->stop]
        //beat [1, 0.5, 1, 0.5] -> timeInterval [0, 1, 0.5, 1, 0.5->stop]
        //offsetBpm 3 -> timeinterval [1, 1, 1] [4, 1, 0.5, 1, 0.5-> stop]
        let interval : Double = 60.0 / Double(bpm)
        var beatsTimeInterval : [TimeInterval] = [] //last stop
        if let _ = offsetBpm {
            beatsTimeInterval.append(TimeInterval(Double(offsetBpm!+1)*interval))
        } else {
            beatsTimeInterval.append(TimeInterval(interval))
        }
        for note in notes {
            beatsTimeInterval.append(TimeInterval( Double(60.0 * note.beat.rawValue / Double(bpm)) ))
        }
        return beatsTimeInterval
    }
}
