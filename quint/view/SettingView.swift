//
//  SettingView.swift
//  quint
//
//  Created by Mikhael Budi Mulya Marpaung on 18/05/22.
//

import UIKit
import MessageUI
import SwiftUI
import Foundation

struct SettingView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(#colorLiteral(red: 0.9354777932, green: 0.9454266429, blue: 0.9624565244, alpha: 1))
                    .ignoresSafeArea()
                
                VStack{
                    DarkModeToggle()

                    VStack(alignment: .leading){
                        Text("Privacy")
                            .font(.title3)
                            .bold()
                            .padding(.leading, 35)
                            .padding(.bottom, -20.0)
                            
                        PrivacyPolicyButton()
                    }
                    .padding()
                    
                    VStack(alignment: .leading){
                        Text("More")
                            .font(.title3)
                            .bold()
                            .padding(.leading, 35)
                            .padding(.bottom, -15.0)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .frame(width: 300, height: 250)
                                .padding()
                                .shadow(color: .gray, radius: 10, x: 0, y: 2)
                            VStack{
                                VStack(alignment: .leading){
                                    Text("Terms and Condition")
                                        .font(.headline)
                                        .bold()
                                    Text("read agreement acts as legal contracts")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                    
                                    
                                }
                                .padding(.trailing, 24)
                                Rectangle().fill(Color.gray).frame(width: 235, height: 1, alignment: .center)
                                    .padding([.trailing, .leading])
                                
                                TellaFriendButton()
                                
                                Rectangle().fill(Color.gray).frame(width: 235, height: 1, alignment: .center)
                                    .padding([.trailing, .leading])
                                
                                AboutUsButton()
                                
                                Rectangle().fill(Color.gray).frame(width: 235, height: 1, alignment: .center)
                                    .padding([.trailing, .leading])
                                
                                VStack(alignment: .leading){
                                    Text("Rate")
                                        .font(.headline)
                                        .bold()
                                    Text("help us to be better")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.trailing, 141)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

