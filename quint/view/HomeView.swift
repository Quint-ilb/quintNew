//
//  HomeView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 15/05/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var musicNM : MusicalNoteModel
    @State var isActive : Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.9354777932, green: 0.9454266429, blue: 0.9624565244, alpha: 1))
                    .ignoresSafeArea()
                
                VStack {
                    Text("Progress")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.gray)
                        .frame(width: 340, height: 24, alignment: .leading)
                        .padding()
                    
                    
                    ZStack {
                        CircularProgressView()
                        Text("80%")
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    
                    Text("Musical Note")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.gray)
                        .frame(width: 340, height: 24, alignment: .leading)
                        .padding()
                    
                    
                    List {
                        ForEach(musicNM.musicals){
                            music in MusicalNoteTable(musical: music)
                        }
                    }
                }
            }
            .navigationTitle("Dashboard")
            
            //temp
            NavigationLink(destination: ExerciseView(rootIsActive: self.$isActive), isActive: self.$isActive) {
                Text("to exercise view")
            }
            }
        }
    }
}

                
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(musicNM: MusicalNoteModel())
    }
}
