//
//  ContentView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

struct ContentView: View {
    
    //key : value
    @AppStorage("isPassOnboarding") var isShowOnboarding : Bool = true
    
    var body: some View {
        if (isShowOnboarding) {
            OnBoardView()
        }else {
            HomeView()
//            ExerciseView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
