//
//  HomeView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 15/05/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("exercise-\(ExerciseCategory.rhythm.rawValue)") var finishedlevel : Int = 5
    
    var musicNM : MusicalNoteModel = MusicalNoteModel()
    
    @State var musicalNote : MusicalNote?
    @State var isActive : Bool = false
    
    var body: some View {
        ZStack {
            if(musicalNote != nil) {
                NavigationLink(destination: ExerciseView(
                    exercise: musicalNote!.exercise!,
                    playerManager: PlayerManager()._init(notes: musicalNote!.exercise!.notes,
                                                         bpm: musicalNote!.exercise!.bpms[0]),
                    bpmIndex: 0), isActive: $isActive, label: {
                        
                    })
            }
            
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
                
                List {
                    Section(header:Text("Musical Note")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.gray)
                            //                            .frame(width: 340, height: 24, alignment: .leading)
                        .padding()) {
                            ForEach(0..<musicNM.musicals.count){ i in
                                if(musicNM.musicals[i].exercise != nil) {
                                    Button(action: {
                                        musicalNote = musicNM.musicals[i]
                                        isActive = true
                                    }, label: {
                                        MusicalNoteTable(musical: musicNM.musicals[i], isLocked: finishedlevel+1 < musicNM.musicals[i].level!)
                                    }).disabled( finishedlevel+1 < musicNM.musicals[i].level! )
                                } else {
                                    MusicalNoteTable(musical: musicNM.musicals[i], isLocked: false)
                                        .overlay(NavigationLink(destination: RhythmView(), label: {
                                            EmptyView()
                                        }).opacity(0))
                                    
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
                                    Button(action: {
                                        musicalNote = musicNM.musicScale[i]
                                        isActive = true
                                    }, label: {
                                        MusicalNoteTable(musical: musicNM.musicScale[i], isLocked: finishedlevel+1 < musicNM.musicScale[i].level!)
                                    }).disabled( finishedlevel+1 < musicNM.musicScale[i].level! )
                                }
                            }
                        }
                    
                    Section(header:Text("Sight Reading")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.gray)
                        .padding()) {
                            ForEach(0..<musicNM.sightReading.count){ i in
                                if(musicNM.sightReading[i].exercise != nil) {
                                    Button(action: {
                                        musicalNote = musicNM.sightReading[i]
                                        //                                        playerManager = PlayerManager()
                                        isActive = true
                                    }, label: {
                                        MusicalNoteTable(musical: musicNM.sightReading[i], isLocked: finishedlevel+1 < musicNM.sightReading[i].level!)
                                    }).disabled( finishedlevel+1 < musicNM.sightReading[i].level! )
                                }
                                
                            }
                        }
                }
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 10)
                    .background(Color.bgPrimary)
            }.background(Color.bgPrimary)
            
        }.onAppear {
            musicalNote = nil
            isActive = false
        }
    }
    
    func onPress() {
        
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(musicNM: MusicalNoteModel())
    }
}
