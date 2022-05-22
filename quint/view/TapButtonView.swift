//
//  TapButtonView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 20/05/22.
//

import SwiftUI

struct TapButtonView: View {
    
    //    @Binding var isPressed: Bool
    //    @Binding var buttonLabel: TapButtonState
    var buttonLabel: String
    @State var radius: CGFloat
    
    var body: some View {
        ZStack{
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.771204412, green: 0.8212063313, blue: 0.8846092224, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .frame(width: radius*2*1.4, height: radius*2*1.4, alignment: .center)
            
            //            Circle()
            //                .stroke(lineWidth: 0.1)
            //                .frame(width: 198.96, height: 198.96, alignment: .center)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.7532736063, green: 0.77320081, blue: 0.8029195666, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: radius*2*1.3, height: radius*2*1.4, alignment: .center)
                .shadow(radius: 1)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8679115176, green: 0.8828440309, blue: 0.904078424, alpha: 1)), Color(#colorLiteral(red: 0.9795069098, green: 0.9844784141, blue: 0.9886956811, alpha: 1)), Color(#colorLiteral(red: 0.9795069098, green: 0.9844784141, blue: 0.9886956811, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: radius*2, height: radius*2, alignment: .center)
            
            Text(buttonLabel)
                .font(Font.system(size: (36/153.19)*(radius*2), weight: .semibold))
                .multilineTextAlignment(.center)
                .overlay {
                    LinearGradient(
                        colors: [Color(#colorLiteral(red: 0.8556842208, green: 0.2977557182, blue: 0.9805133939, alpha: 1)), Color(#colorLiteral(red: 0.1320074499, green: 0.7720178366, blue: 0.8974127769, alpha: 1))],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(Text(buttonLabel)
                        .font(Font.system(size: (36/153.19)*(radius*2), weight: .semibold))
                        .multilineTextAlignment(.center))
                }
        }
    }
}

//struct TapButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        TapButtonView()
//    }
//}
