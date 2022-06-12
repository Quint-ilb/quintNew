//
//  ContentView.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

struct ContentView: View {
    
    var musicNM : MusicalNoteModel
    
    //key : value
    @AppStorage("isPassOnboarding") var isShowOnboarding : Bool = true
    @AppStorage("isDarkMode") var isDarkMode : Bool = true
    
    var body: some View {
        if (isShowOnboarding) {
            OnBoardView()
        }else {
            TabBarFixedNew().preferredColorScheme(isDarkMode ? .dark : .light)
//            ExerciseView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(musicNM: MusicalNoteModel())
    }
}
