//
//  CircularProgressView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 15/05/22.
//

import SwiftUI

struct CircularProgressView: View {
    
    @State var progress = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8556842208, green: 0.2977557182, blue: 0.9805133939, alpha: 1)), Color(#colorLiteral(red: 0.1320074499, green: 0.7720178366, blue: 0.8974127769, alpha: 1)), Color(#colorLiteral(red: 0.8556842208, green: 0.2977557182, blue: 0.9805133939, alpha: 1))]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: progress)
        }
        .frame(width: 105.72, height: 105.72)
        .padding()
        .onAppear(){
            progress = 1
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
