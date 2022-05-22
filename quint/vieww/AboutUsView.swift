//
//  AboutUsView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 22/05/22.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color(#colorLiteral(red: 0.9354777932, green: 0.9454266429, blue: 0.9624565244, alpha: 1))
                    .ignoresSafeArea()
                
                VStack{
                    Us1()
                    Spacer()
                        .frame(height: 30)
                    Us2()
                    
                    
                    
                }
                
            }
            
            Text("Hello")
            
            .navigationBarTitle("About Us", displayMode: .inline)
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}

struct Us1: View {
    var body: some View {
        HStack{
            VStack {
                Image("aldi")
                    .frame(width: 100, height: 70)
                Text("Aldi")
                    .font(.system(size: 11, weight: .medium))
                Text("Project Manager")
                    .font(.system(size: 11, weight: .light))
                
            }
            VStack {
                Image("kael")
                    .frame(width: 100, height: 70)
                Text("Kael")
                    .font(.system(size: 11, weight: .medium))
                Text("Developer")
                    .font(.system(size: 11, weight: .light))
                
            }
            VStack {
                Image("zak")
                    .frame(width: 100, height: 70)
                Text("Zakki")
                    .font(.system(size: 11, weight: .medium))
                Text("Developer")
                    .font(.system(size: 11, weight: .light))
                
            }
        }
    }
}

struct Us2: View {
    var body: some View {
        HStack{
            VStack {
                Image("wid")
                    .frame(width: 100, height: 70)
                Text("Widya")
                    .font(.system(size: 11, weight: .medium))
                Text("Developer")
                    .font(.system(size: 11, weight: .light))
                
            }
            VStack {
                Image("jov")
                    .frame(width: 100, height: 70)
                Text("Jovanka")
                    .font(.system(size: 11, weight: .medium))
                Text("Designer")
                    .font(.system(size: 11, weight: .light))
                
            }
        }
    }
}
