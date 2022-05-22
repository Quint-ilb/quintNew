//
//  TabMantap.swift
//  quint
//
//  Created by Zakki Mudhoffar on 22/05/22.
//

import SwiftUI

struct TabMantap: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "chart.pie")
                    Text("Dashboard")
                }
            
            AchievementView()
                .tabItem{
                    Image(systemName: "checkmark.seal")
                    Text("Achievement")
                }
            
//            TapButtonView()
//                .tabItem{
//                    Image(systemName: "gearshape.fill")
//                    Text("Settings")
//                }
        }
        .accentColor(Color(#colorLiteral(red: 0.3679022491, green: 0.761993885, blue: 0.884503603, alpha: 1)))
    }
}

struct TabMantap_Previews: PreviewProvider {
    static var previews: some View {
        TabMantap()
    }
}
