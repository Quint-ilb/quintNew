//
//  HomeView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 15/05/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

        NavigationView{
            ZStack{
                Color(#colorLiteral(red: 0.9354777932, green: 0.9454266429, blue: 0.9624565244, alpha: 1))
                    .ignoresSafeArea()

        ZStack{
            RoundedRectangle(cornerRadius: 22)
                .stroke(.black)
                .padding(.bottom)
                .frame(width: 356, height: 154)
            
            HStack {
                VStack{
                    Text("Lorem Ipsum dolor...")
                        .font(.system(size: 10))
                    Text("Lorem ipsum dolor sit amet, consectetur")
                        .font(.system(size: 8))
                    Text("adipiscing elit, sed do eiusmod tempor")
                        .font(.system(size: 8))
                }

                
                VStack {
                    Text("Progress")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .opacity(60.0)
                        .frame(width: 360, alignment: .leading)
                    
                    CircularProgressView()
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    .navigationTitle("Dashboard")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
