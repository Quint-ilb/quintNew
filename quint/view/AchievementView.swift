//
//  AchievementView.swift
//  quint
//
//  Created by Rinaldi Alfian on 22/05/22.
//

import SwiftUI

struct AchievementView: View {
    @AppStorage("exercise-\(ExerciseCategory.rhythm.rawValue)") var finishedlevel : Int = 0
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 239/255, green: 241/255, blue: 245/255).edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image("Profile")
                        .resizable()
                        .frame(width: 177, height: 177, alignment: .center)
                        .padding()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 332, height: 362, alignment: .center)
                            .foregroundColor(.white)
                        VStack{
                            Text("Badges")
                                .font(.system(size: 20, weight: .semibold))
                                .frame(width: 300, height: 24, alignment: .leading)
                            
                            HStack{
                                Image(finishedlevel > 0 ? "medalRectBlue" : "medalEmptyTri")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 47, height: 90, alignment: .center)
                                    .clipped()
                                    .padding(.horizontal, 10)
                                    
                                    
                                //lanjut aj ya // tq
                                Image(finishedlevel > 1 ? "medalRectPurple" : "medalEmptyTri")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 47, height: 90, alignment: .center)
                                    .clipped()
                                    .padding(.horizontal, 10)
                                    
                                Image(finishedlevel > 2 ? "medalTriBlue" : "medalEmptyTri")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 47, height: 90, alignment: .center)
                                    .clipped()
                                    .padding(.horizontal, 10)
                                    
                                Image(finishedlevel > 3 ? "medalTriRed" : "medalEmptyTri")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 47, height: 90, alignment: .center)
                                    .clipped()
                                    .padding(.horizontal, 10)
                                    
                            } .padding()
                            Image(finishedlevel > 3 ? "trophy" : "trophyEmpty")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 79, height: 107, alignment: .center)
                                .clipped()
                                .padding()
                        }
                        
                        
                    }.padding(.vertical, 30)
                }
            }.navigationTitle("Achievement")
        }
        
       
        
        
    }
}

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView()
    }
}
