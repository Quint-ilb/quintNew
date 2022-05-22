//
//  HomeView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 15/05/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("exercise-\(ExerciseCategory.rhythm.rawValue)") var finishedlevel : Int = 0
    
    var musicNM : MusicalNoteModel = MusicalNoteModel()
    
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
                        let progress : Double = Double(1) / Double(4) * Double(finishedlevel)
                        CircularProgressView(progress: progress)
                        Text("\(String(format: "%.0f", (progress*100)))%")
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundColor(.gray)
                    }.padding(.bottom, 20)
                    
                    //                    Text("Musical Note")
                    //                        .font(.system(size: 20, weight: .semibold))
                    //                        .foregroundColor(.gray)
                    //                        .frame(width: 340, height: 24, alignment: .leading)
                    //                        .padding()
                    
                    
                    List {
                        Section(header:Text("Musical Note")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.gray)
                                //                            .frame(width: 340, height: 24, alignment: .leading)
                            .padding()) {
                                ForEach(0..<musicNM.musicals.count){ i in
                                    if(musicNM.musicals[i].exercise != nil) {
                                        NavigationLink(destination: ExerciseView(exercise: musicNM.musicals[i].exercise!)) {
                                            MusicalNoteTable(musical: musicNM.musicals[i], isLocked: finishedlevel+1 < musicNM.musicals[i].level!)
                                        }.disabled( finishedlevel+1 < musicNM.musicals[i].level! )
                                    } else {
                                        NavigationLink(destination: RhythmView()){
                                            MusicalNoteTable(musical: musicNM.musicals[i], isLocked: false)
                                            //                                        .navigationBarHidden(true)
                                        }
                                    }
                                    
                                }
                            }
                        
                        Section(header:Text("Music Scale")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.gray)
                                //                            .frame(width: 340, height: 24, alignment: .leading)
                            .padding()) {
                                ForEach(0..<musicNM.musicScale.count){ i in
                                    if(musicNM.musicScale[i].exercise != nil) {
                                        NavigationLink(destination: ExerciseView(exercise: musicNM.musicScale[i].exercise!)) {
                                            MusicalNoteTable(musical: musicNM.musicScale[i], isLocked: finishedlevel+1 < musicNM.musicScale[i].level!)
                                        }.disabled( finishedlevel+1 < musicNM.musicScale[i].level! )
                                    } else {
                                        NavigationLink(destination: RhythmView()){
                                            MusicalNoteTable(musical: musicNM.musicScale[i], isLocked: false)
                                            //                                        .navigationBarHidden(true)
                                        }
                                    }
                                    
                                }
                                
                            }
                        
                        Section(header:Text("Sight Reading")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.gray)
                                //                            .frame(width: 340, height: 24, alignment: .leading)
                            .padding()) {
                                ForEach(0..<musicNM.sightReading.count){ i in
                                    if(musicNM.sightReading[i].exercise != nil) {
                                        NavigationLink(destination: ExerciseView(exercise: musicNM.sightReading[i].exercise!)) {
                                            MusicalNoteTable(musical: musicNM.sightReading[i], isLocked: finishedlevel+1 < musicNM.sightReading[i].level!)
                                        }.disabled( finishedlevel+1 < musicNM.sightReading[i].level! )
                                    } else {
                                        NavigationLink(destination: RhythmView()){
                                            MusicalNoteTable(musical: musicNM.sightReading[i], isLocked: false)
                                            //                                        .navigationBarHidden(true)
                                        }
                                    }
                                    
                                }
                                
                            }
                    }
                    
                }
            }
            .navigationBarTitle("Dashboard")
            
            
            //temp
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(musicNM: MusicalNoteModel())
    }
}
