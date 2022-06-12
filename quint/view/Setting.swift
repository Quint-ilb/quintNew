//
//  Setting.swift
//  quint
//
//  Created by Mikhael Budi Mulya Marpaung on 22/05/22.
//


import SwiftUI
import Foundation

struct AboutUsView: View {
    var body: some View {
            ScrollView{
                VStack(alignment: .center){
                    HStack{
                        Spacer()
                        VStack{
                            Image("memoR")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Aldi")
                                .bold()
                                .font(.caption)
                            Text("Product Manager")
                                .font(.caption2)
                        }
                        VStack{
                            Image("memoM")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Kael")
                                .bold()
                                .font(.caption)
                            Text("Developer")
                                .font(.caption2)
                        }
                        VStack{
                            Image("memoZ")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Zakki")
                                .bold()
                                .font(.caption)
                            Text("Developer")
                                .font(.caption2)
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Image("memoW")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Widya")
                                .bold()
                                .font(.caption)
                            Text("Developer")
                                .font(.caption2)
                        }
                        VStack{
                            Image("memoJ")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Jovanka")
                                .bold()
                                .font(.caption)
                            Text("Designer")
                                .font(.caption2)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 30)
                    VStack(alignment: .leading){
                        Text("We would like to ask you for a favour.")
                            .font(.headline)
                            .bold()
                            
                        Text("We would like to ask you for a small favour that can help learn music theory and hopefully help more people with understanding music theory.")
                            .font(.subheadline)
                    }
                    .padding([.leading, .trailing],30)
                    .padding(.bottom)
                    VStack(alignment: .leading){
                        Text("Why do we ask you for this and how it can be helpful for Note Trainer?")
                            .font(.headline)
                            .bold()
                        Text("Apple basically grades apps by a lot of factors and one of the more important ones is reviews. This means that getting more reviews will help us rank higher and get more exposure.")
                            .font(.subheadline)
                    }
                    .padding([.leading, .trailing],30)
                    .padding(.bottom)
                    VStack(alignment: .leading){
                        Text("What does this mean to us? ")
                            .font(.headline)
                            .bold()
                        Text("It would mean the world to us - literally. As indie developers working on Note Trainer as a side project, the feedback from our users is precious. So we will really appreciate your 15 seconds and will be more than happy to finish our day reading your reviews.")
                            .font(.subheadline)
                    }
                    .padding([.leading, .trailing],30)
                    .padding(.bottom)
            }
        }
    }
}


struct AboutUsButton: View {
    var body: some View {
        VStack(alignment: .leading){
            NavigationLink(destination: AboutUsView() .navigationTitle("About Us")){
                VStack(alignment: .leading){
                    Text("About Us")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                    Text("know us more")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.trailing, 176)
            }
        }
    }
}

struct PrivacyPolicyButton: View {
    var body: some View {
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
}

struct DarkModeToggle: View {
    @AppStorage("isDarkMode") var isDarkMode : Bool = true
//    @State private var isDarkMode : Bool = false
    var body: some View {
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
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.9354777932, green: 0.9454266429, blue: 0.9624565244, alpha: 1))
                .ignoresSafeArea()
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
}

func tellaFriend() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
}

struct TellaFriendButton: View {
    var body: some View {
        Button(action: {tellaFriend()}) {
            VStack(alignment: .leading){
                Text("Tell a Friend")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
                Text("let your friends know our app")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.trailing, 83)
    }
}

