//
//  TabBarFixedNew.swift
//  quint
//
//  Created by Zakki Mudhoffar on 22/05/22.
//

import SwiftUI

struct TabBarFixedNew: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
                HomeView()
                    .tabItem {
                        Image(systemName: "chart.pie")
                        Text("Dashboard")
                    }
                    .tag(1)
                
                AchievementView()
                    .tabItem {
                        Image(systemName: "checkmark.seal")
                        Text("Achievement")
                    }
                    .tag(2)
                
                SettingView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
                    .tag(3)
            }
            
            .accentColor(Color(#colorLiteral(red: 0.3679022491, green: 0.761993885, blue: 0.884503603, alpha: 1)))
            // global, for all child views
            
            .navigationBarTitle(Text(navigationBarTitle), displayMode: .large)
            .navigationBarHidden(navigationBarHidden)
        }
    }
}

struct TabBarFixedNew_Previews: PreviewProvider {
    static var previews: some View {
        TabBarFixedNew()
    }
}


private extension TabBarFixedNew {
    var navigationBarTitle: String {
        tabSelection == 1 ? "Dashboard" : "Achievements" 
        
    }
    
    var navigationBarHidden: Bool {
        tabSelection == 3
    }
}


