//
//  AchievementView.swift
//  quint
//
//  Created by Rinaldi Alfian on 22/05/22.
//

import SwiftUI

struct AchievementView: View {
//    @AppStorage("exercise-\(ExerciseCategory.rhythm.rawValue)") var finishedlevel : Int = 0
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
                                Image("medalEmptyTri")
                                    .resizable()
                                    .frame(width: 47, height: 90)
                                    .padding()
                                Image("medalEmptyTri")
                                    .resizable()
                                    .frame(width: 47, height: 90)
                                    .padding()
                                Image("medalEmptyRect")
                                    .resizable()
                                    .frame(width: 47, height: 90)
                                    .padding()
                                Image("medalEmptyRect")
                                    .resizable()
                                    .frame(width: 47, height: 90)
                                    .padding()
                            }
                            Image("trophyEmpty")
                                .resizable()
                                .frame(width: 79, height: 107)
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
