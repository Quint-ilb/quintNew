//
//  SettingView.swift
//  quint
//
//  Created by Mikhael Budi Mulya Marpaung on 18/05/22.
//

import SwiftUI
import Foundation

let backgroundColor : Color = Color(red: 239, green: 241, blue: 245)

struct SettingView: View {
    @State private var isDarkMode : Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(width: 300, height: 80)
                            .padding()
                            .shadow(color: .gray, radius: 10, x: 0, y: 2)
                        
                        Toggle(isOn: $isDarkMode, label: {
                            VStack(alignment: .leading){
                                Text("Dark Mode")
                                    .font(.headline)
                                    .bold()
                                Text("display setting light-colored text")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                        })
                        .padding([.trailing, .leading], 65)
                    }
                    VStack(alignment: .leading){
                        Text("Privacy")
                            .font(.title3)
                            .bold()
                            .padding(.leading, 35)
                            .padding(.bottom, -15.0)
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .frame(width: 300, height: 80)
                                .padding()
                                .shadow(color: .gray, radius: 10, x: 0, y: 2)
                            VStack(alignment: .leading){
                                Text("Privacy Policy")
                                    .font(.headline)
                                    .bold()
                                Text("read documents manages client data")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                
                            }
                            .padding(.trailing, 38)
                        }
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
                                
                                VStack(alignment: .leading){
                                    Text("Tell a Friend")
                                        .font(.headline)
                                        .bold()
                                    Text("let your friends know our app")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.trailing, 83)
                                Rectangle().fill(Color.gray).frame(width: 235, height: 1, alignment: .center)
                                    .padding([.trailing, .leading])
                                
                                VStack(alignment: .leading){
                                    Text("About Us")
                                        .font(.headline)
                                        .bold()
                                    Text("know us more")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.trailing, 176)
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
                    Spacer()
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
