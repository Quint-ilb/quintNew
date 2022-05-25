//
//  Reward.swift
//  quint
//
//  Created by Widya Limarto on 21/05/22.
//

import Foundation

struct Reward {
    var image: String
    var emptyImage: String
    var level: Int
    
    static var level1 = Reward(image: "medalRectBlue", emptyImage: "medalEmptyRect", level: 1)
    static var level2 = Reward(image: "medalRectPurple", emptyImage: "medalEmptyRect", level: 2)
    static var level3 = Reward(image: "medalTriRed", emptyImage: "medalEmptyTri", level: 3)
    static var level4 = Reward(image: "medalTriBlue", emptyImage: "medalEmptyTri", level: 4)
    static var finish = Reward(image: "", emptyImage: "medalEmptyRect", level: 5)
}
