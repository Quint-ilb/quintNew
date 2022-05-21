//
//  PopUpState.swift
//  quint
//
//  Created by Widya Limarto on 21/05/22.
//

import Foundation
import SwiftUI


struct PopUpState {
    var bg : String
    var image : String
    var title : String
    var description: String
    var primaryTitle: String
    var secondaryTitle : String?
    var onPressPrimary: () -> ()
    var onPressSecondary: () -> ()

    
    static func successDefault(onPressPrimary: @escaping () -> (), onPressSecondary: @escaping () -> ()) -> PopUpState {
        return PopUpState(bg: "successPopUpDefaultBg", image: "checkRound", title: "Level Success", description: "Congratulations!, learn more to collect the medals.", primaryTitle: "Next", onPressPrimary: onPressPrimary, onPressSecondary: onPressSecondary)
    }
    
    
    static func failedDefault(onPressPrimary: @escaping () -> (), onPressSecondary: @escaping () -> ()) -> PopUpState {
        return PopUpState(bg: "successPopUpDefaultBg", image: "closeRound", title: "Level Failed", description: "Sorry you have not successfully completed the lesson.", primaryTitle: "Try Again", secondaryTitle: "Go to main page", onPressPrimary: onPressPrimary, onPressSecondary: onPressSecondary)
    }
    
    
    static func successReward(reward: Reward, onPressPrimary: @escaping () -> (), onPressSecondary: @escaping () -> ()) -> PopUpState {
        return PopUpState(bg: "successPopUpBg", image: reward.image, title: "Success", description: "Congratulations! you have successfully completed the lesson, learn more to collect all medals.", primaryTitle: "Next", onPressPrimary: onPressPrimary, onPressSecondary: onPressSecondary)
    }
    
    static func failedReward(reward: Reward, onPressPrimary: @escaping () -> (), onPressSecondary: @escaping () -> ()) -> PopUpState {
        return PopUpState(bg: "failedPopUpBg", image: reward.emptyImage, title: "Failed", description: "Sorry you have not successfully completed the lesson.", primaryTitle: "Try Again", secondaryTitle: "Go to main page", onPressPrimary: onPressPrimary, onPressSecondary: onPressSecondary)
    }
    
    
    
}
