//
//  OnBoardView.swift
//  quint
//
//  Created by Rinaldi Alfian on 18/05/22.
//

import SwiftUI

struct OnBoardView: View {
    
    var pageToBoard: [OnboardList] = OnList
    
    @State var selectedItem: Int = 1
    var body: some View {
        ZStack{
            ScrollView(.init()){
                TabView(selection: $selectedItem){
                    ForEach(pageToBoard) { boarding in
                        OnBoarding(eachBoarding: boarding)
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                .overlay(
                    HStack(spacing: 15){
                        ForEach(0..<pageToBoard.count){ index in
                            Capsule()
                                .fill(selectedItem-1 == index ? Color.white : Color.gray)
                                .frame(width: 110, height: 3)
                        }
                    }
                        .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                        .padding(.bottom,100)
                        .offset(y:350)
                )
                
            }.ignoresSafeArea()
            
            VStack{
                Spacer()
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "isPassOnboarding")
                }, label: {
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
                })
            }.padding(.horizontal, 15).padding(.bottom, 28)
            
        }
        
                        
    }
}
struct OnBoarding: View {
    var eachBoarding: OnboardList
    var body: some View{
        ZStack{
            
            Image(eachBoarding.Image)
            VStack{
                Spacer()
                Text(eachBoarding.title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                
                Text(eachBoarding.content)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding()
            }.padding(.bottom, 150)
        }
        
    }
    
}



var OnList = [
    OnboardList(id: 1, Image: "image_13", content: "Rhythm is ‘the placement of sounds in time, in a regular and repeated pattern.’ ", title: "Rhythm"),
    OnboardList(id: 2, Image: "image_12", content: "A beat if defined as a regular, repeating pulse that underlies a musical pattern.", title: "Beat"),
    OnboardList(id: 3, Image: "image_14", content: "Tempo is the unit of measure for beats.", title: "Tempo")
    
    
]



struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}

