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
                                NavigationLink(destination: PrivacyPolicyView() .navigationTitle("Privacy Policy")){
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text("Privacy Policy")
                                                .font(.headline)
                                                .bold()
                                                .foregroundColor(.black)
                                            Text("read documents manages client data")
                                                .font(.footnote)
                                                .foregroundColor(.secondary)
                                        }
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                }
                            }
                            .padding(.trailing, 25)
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

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView{
            VStack{
                Text("Last updated: *bind here*")
                    .font(.subheadline)
                VStack(alignment: .leading){
                    Text("Overview")
                        .bold()
                        .padding(.bottom, -5)
                    Text("""
Note Trainer app does not collect any personal data. All counters’ information that you input into the Note Trainer app remains privately stored on your device.

We take your privacy very seriously. Note Trainer app always want make better development decisions and choose where to focus development effort. Note Trainer app does not share, sell or rent your data, and the anonymous information is only collected to help make the app better.
""")
                 .padding(.bottom)
                    
                    Text("Your Consent")
                        .bold()
                        .padding(.bottom, -5)
                    Text("""
By using Note Trainer app, you consent to this privacy policy. Changes to this Privacy Policy We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. These changes are effective immediately after they are posted on this page. Contact Us If you have any questions or suggestions, you can contact us at contact [at] notetrainer [dot] com If you contact us through this email, we will see your name and email address. Your information is only to assist us in providing customer support to you and won’t be added to a mailing list or sold to a third-party company. If you wish, you may email us to remove your name and email address from our inbox.
""")
                 .padding(.bottom)
                
                    Text("Your Consent")
                        .bold()
                        .padding(.bottom, -5)
                    Text("""
By using Note Trainer app, you consent to this privacy policy.
""")
                 .padding(.bottom)
                    
                    Text("Changes to this Privacy Policy")
                        .bold()
                        .padding(.bottom, -5)
                    Text("""
We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. These changes are effective immediately after they are posted on this page. Contact Us If you have any questions or suggestions, you can contact us at contact [at] notetrainer [dot] com If you contact us through this email, we will see your name and email address. Your information is only to assist us in providing customer support to you and won’t be added to a mailing list or sold to a third-party company. If you wish, you may email us to remove your name and email address from our inbox.
""")
                 .padding(.bottom)
                    
                    Text("Contact Us")
                        .bold()
                        .padding(.bottom, -5)
                    Text("""
If you have any questions or suggestions, you can contact us at contact [at] notetrainer [dot] com

If you contact us through this email, we will see your name and email address. Your information is only to assist us in providing customer support to you and won’t be added to a mailing list or sold to a third-party company. If you wish, you may email us to remove your name and email address from our inbox.
""")
                 .padding(.bottom)
                }
                .padding([.trailing, .leading], 20)
            }
        }
    }
}


struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
