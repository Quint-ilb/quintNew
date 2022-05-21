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
                                
                                Rectangle().fill(Color.gray).frame(width: 235, height: 1, alignment: .center)
                                    .padding([.trailing, .leading])
                                
                                VStack(alignment: .leading){
                                    NavigationLink(destination: AboutUsView() .navigationTitle("About Us")){
                                        VStack(alignment: .leading){
                                            Text("About Us")
                                                .font(.headline)
                                                .bold()
                                            Text("know us more")
                                                .font(.footnote)
                                                .foregroundColor(.secondary)
                                        }
                                        .padding(.trailing, 176)
                                    }
                                
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

func tellaFriend() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
}


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
struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
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
