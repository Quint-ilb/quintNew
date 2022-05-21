//
//  PopUpChallengeContentView.swift
//  quint
//
//  Created by Widya Limarto on 21/05/22.
//

import SwiftUI

struct PopUpChallengeContentView: View {
    var data : PopUpState
    
    var body: some View {
        VStack {
            ZStack {
                Image(data.bg)
                    .resizable()
                    .frame(width: 324, height: 239, alignment: .center)
                Image(data.image)
                    .resizable()
                    .frame(width: 110, height: 110)
            }
            Text(data.title)
                .font(.system(size: 22, weight: .bold))
                .frame(height: 42)
            Text(data.description)
            .font(.system(size: 15, weight: .regular))
            .padding(.horizontal, 15)
            .multilineTextAlignment(.center)
            
            VStack {
                VStack(alignment: .center){
                    Button(action: {
                        data.onPressPrimary()
                    }, label: {
                        Spacer()
                        Text(data.primaryTitle)
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    })
                    .padding(16)
                    .background(LinearGradient(colors: [.primaryColor, .primaryLightColor], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(31.83)
                }.padding(.horizontal, 38)
                
                
                
                
                if data.secondaryTitle != nil {
                    Spacer()
//                    NavigationLink(destination: HomeView()){
                        
                        VStack{
                            Button(action: {
                                print("tap")
                                data.onPressSecondary()
                            }, label: {
                                HStack{
                                    Spacer()
                                    Text(data.secondaryTitle!)
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundColor(.black)
                                    Spacer()
                                }.padding(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 31.83)
                                        .stroke(Color.primaryColor, lineWidth: 3)
                                )
                            })
                        }.padding(.horizontal, 38)
                        
                        
//                    }
                    
                }
                
            }.frame(height: 121, alignment: .center)
        }
    }
    
}

struct PopUpChallengeContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpChallengeContentView(data: PopUpState.successDefault(onPressPrimary: {}, onPressSecondary: {}))
    }
                                                                  }
