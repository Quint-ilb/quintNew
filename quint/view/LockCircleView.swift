//
//  LockCircleView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 21/05/22.
//

import SwiftUI

struct LockCircleView: View {
    var isLocked: Bool
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.3)
                .foregroundColor(.gray)
                .frame(width: 54.35, height: 54.35)
            
            Image(isLocked ? "locked" : "unlocked")
        }
    }
}

struct LockCircleView_Previews: PreviewProvider {
    static var previews: some View {
        LockCircleView(isLocked: true)
    }
}
