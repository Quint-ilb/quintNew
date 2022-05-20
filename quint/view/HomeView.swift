//
//  HomeView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 15/05/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
