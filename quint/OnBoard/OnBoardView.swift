//
//  OnBoardView.swift
//  quint
//
//  Created by Rinaldi Alfian on 18/05/22.
//

import SwiftUI

struct OnBoardView: View {
    var pageToBoard: [OnboardList]
    var body: some View {
        ScrollView(.init()){
            TabView{
                ForEach(pageToBoard) {
                    boarding in OnBoarding(eachBoarding: boarding)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                HStack(spacing: 15){
                    ForEach(pageToBoard){ index in
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 100, height: 4)

                    }
                }
                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    .padding(.bottom,10)

                ,alignment: .init(horizontal: .center, vertical: .lastTextBaseline)

            )
        }
        
        .ignoresSafeArea()
    }
}
struct OnBoarding: View {
    var eachBoarding: OnboardList
    var body: some View{
        ZStack{
            
            Image(eachBoarding.Image)
            VStack{
                
                Text(eachBoarding.title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    
                    
                    
                    
                
                Text(eachBoarding.content)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding()
                

                
                VStack{
                    Text("Get Started")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,  alignment: .center)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background(
                            Rectangle()
                                .fill(Color.white)

                        )
                        .padding()
                }


                .padding(.bottom)
               
            }
            
         
            
  
        }
       
    }

}



var OnList = [
    OnboardList(id: 1, Image: "image 13", content: "Rhythm is ‘the placement of sounds in time, in a regular and repeated pattern.’ ", title: "Rhythm"),
    OnboardList(id: 2, Image: "image 12", content: "A beat if defined as a regular, repeating pulse that underlies a musical pattern.", title: "Beat"),
    OnboardList(id: 3, Image: "image 14", content: "Tempo is the unit of measure for beats.", title: "Tempo")


]



struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView(pageToBoard: OnList)
    }
}
