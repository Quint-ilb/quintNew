//
//  AboutUsText.swift
//  quint
//
//  Created by Zakki Mudhoffar on 22/05/22.
//

import SwiftUI

struct AboutUsText: View {
    var body: some View {
        VStack{
            Text("We would like to ask you for a favour")
                .font(.system(size: 17, weight: .bold))
                .frame(width: 328, height: .infinity, alignment: .leading)
            Text("We would like to ask you for a small favour that can help learn music theory and hopefully help more people with understanding music theory.")
                .frame(width: 328, height: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: 45)
            
            Text("We would like to ask you for a favour")
                .font(.system(size: 17, weight: .bold))
                .frame(width: 328, height: .infinity, alignment: .leading)
            Text("We would like to ask you for a small favour that can help learn music theory and hopefully help more people with understanding music theory.")
                .frame(width: 328, height: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: 45)
            
            Text("We would like to ask you for a favour")
                .font(.system(size: 17, weight: .bold))
                .frame(width: 328, height: .infinity, alignment: .leading)
            Text("We would like to ask you for a small favour that can help learn music theory and hopefully help more people with understanding music theory.")
                .frame(width: 328, height: .infinity, alignment: .leading)
        }
    }
}

struct AboutUsText_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsText()
    }
}
