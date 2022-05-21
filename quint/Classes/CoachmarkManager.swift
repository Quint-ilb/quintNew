//
//  CoachmarkManager.swift
//  quint
//
//  Created by Widya Limarto on 20/05/22.
//

import Foundation
import UIKit

enum CoachmarkType: String {
    case tap = "tap"
}

struct Coachmark {
    var image: String?
    var description: String
}

class CoachmarkManager: ObservableObject {
    
    var coachmarkData : [Coachmark]
    @Published var coachmarkIndex : Int = 0
    
    var coachmarkType : CoachmarkType
    
    init(type: CoachmarkType) {
        coachmarkData = Config.coachmarkData[type]!
        coachmarkType = type
        //check localstorage
        coachmarkIndex = UserDefaults.standard.object(forKey: "\(type)-coachmark") as? Int ?? 0
        
    }
    
    func nextCoachmark() {
        guard coachmarkData.count > coachmarkIndex else { return }
        coachmarkIndex += 1
        UserDefaults.standard.set(coachmarkIndex as Int, forKey: "\(coachmarkType)-coachmark")
    }
}

