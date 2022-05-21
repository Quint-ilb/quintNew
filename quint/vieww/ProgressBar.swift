//
//  ProgressBar.swift
//  quint
//
//  Created by Rinaldi Alfian on 21/05/22.
//

import SwiftUI

struct ProgressBar: View {
    var width: CGFloat = 350
    var height: CGFloat = 10
    var percent: CGFloat = 69
    var color1 = Color(red: 94/255, green: 194/255, blue: 225/255)
    var color2 = Color(red: 202/255, green: 86/252, blue: 242/255)
    
    var body: some View {
        let multiplier = width / 100
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color1,color2]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
        }
        
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
