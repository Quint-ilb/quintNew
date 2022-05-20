//
//  HomeView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 15/05/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(#colorLiteral(red: 0.9354777932, green: 0.9454266429, blue: 0.9624565244, alpha: 1))
                    .ignoresSafeArea()
                
                VStack {
                    Text("Progress")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .opacity(60.0)
                        .frame(width: 360, alignment: .leading)
                    
                    CircularProgressView()
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    .navigationTitle("Dashboard")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
