//
//  LevelView.swift
//  quint
//
//  Created by Widya Limarto on 20/05/22.
//

import SwiftUI

struct LevelView: View {
    
    var totalDone: Int
    var totalLevel: Int = 3
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.secondaryColor)
                .frame(width: 200, height: 2)
            HStack{
                ForEach(1..<totalLevel+1) { i in
                    ZStack{
                        if(i <= totalDone) {
                            Circle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.secondaryColor, .primaryColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .frame(width: 62, height: 62, alignment: .center)
                        }else {
                            Circle()
                                .stroke(Color.secondaryColor,lineWidth: 3)
                                .background(.white)
                                .frame(width: 59, height: 59, alignment: .center)
                        }
                        
                        if(i <= totalDone) {
                            Image(systemName: "checkmark").foregroundColor(.white)
                        } else {
                            Text("\(i)")
                        }
                    }
                    if i < totalLevel{
                        Spacer()
                    }
                }
                
            }.frame(width: 295)
        }
    }
}

//struct LevelView_Previews: PreviewProvider {
//    static var previews: some View {
//        LevelView()
//    }
//}
