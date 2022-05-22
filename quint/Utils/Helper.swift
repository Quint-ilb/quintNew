//
//  Helper.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import Foundation
import SwiftUI

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
            beatsTimeInterval.append(TimeInterval(Double(offsetBpm!)*interval))
        } else {
            beatsTimeInterval.append(TimeInterval(interval))
        }
        for note in notes {
            beatsTimeInterval.append(TimeInterval( Double(60.0 * note.beat.rawValue / Double(bpm)) ))
        }
        return beatsTimeInterval
    }
    
    static func getMetronomeBeatInterval(notes: [Note], bpm: Int, offsetBpm: Int? ) -> [TimeInterval] {
        let interval : Double = 60.0 / Double(bpm)
        var sum : Double = 0
        
        notes.forEach { (note) in
            sum += note.beat.rawValue
        }
        let totalBeat = Int(ceil(sum)) + (offsetBpm ?? 0)
        var metronomeInterval : [TimeInterval] = []
        for _ in 0..<totalBeat{
            metronomeInterval.append(interval)
        }
        return metronomeInterval
    }
    
    
    static func generateBlock(offsetBpm: Int, notes: [Note]) -> [[Int]] {
        var arr = [Double(offsetBpm)]
        for i in notes {
            arr.append(i.beat.rawValue)
        }
        var arr2 : [[Int]] = []
        var arr3 : [Int : Int] = [:]
        var isTrue : Bool = true
        for (index,i) in arr.enumerated() {
            var ii = i
            
            while ii > 0{
                var iii : [Int] = []
                iii.append(isTrue ? 1 : 0)
                
                ii -= 0.5
                if arr3[index] == nil {
                    arr3[index] = arr2.count
                    iii.append(index)
                    
                }
                arr2.append(iii)
                isTrue.toggle()
            }
        }
        print("generated box count", arr2.count)
        return arr2
    }
    
    static func getTotalTime(notes: [Note], bpm: Int, offsetBpm: Int) -> TimeInterval {
        let interval : TimeInterval = 60.0/Double(bpm)
        var res : Double = 0
        for note in notes {
            res += note.beat.rawValue
        }
        res += Double(offsetBpm)
        print("debug total time", res * interval, res, bpm, offsetBpm, interval)
        return res * interval + interval
    }
    
    static func getXInitialOffset(generatedBlock: [[Int]]) -> CGFloat {
        return CGFloat(Config.BLOCK_WIDTH * generatedBlock.count / 2)
    }
}
