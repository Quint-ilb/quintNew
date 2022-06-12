//
//  CoachmarkView.swift
//  quint
//
//  Created by Widya Limarto on 22/05/22.
//

import SwiftUI

struct CoachmarkView: View {
    var _frame : CGRect
    var _size : CGSize
    @ObservedObject var coachMarkManager: CoachmarkManager
    var isShowCoachmark: Bool
    
    @State var coachmarkHeight: CGFloat = 0
    
    var body: some View {
        if isShowCoachmark {
            ZStack(alignment: .top){
                Rectangle()
                    .fill(Color.black)
                    .opacity(0.35)
                    .onTapGesture {
                        coachMarkManager.nextCoachmark()
                    }
                
                VStack{
                    let coachmark = coachMarkManager.coachmarkData[coachMarkManager.coachmarkIndex]
                    VStack{
                        Triangle()
                            .fill(Color.bgCoachmark)
                            .frame(width: 27, height: 18)
                            .padding(0)
                            .offset(x: 0, y: 10)
                        VStack(spacing: 0){
                            Text("\(coachmark.description)")
                                .font(.system(size: 12))
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 32)
                        .frame(width: 321)
                        .background(Color.bgCoachmark)
                        .cornerRadius(24)
                        Text("Tap anywhere to next")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.vertical, 14)
                    }.background(
                        GeometryReader { proxy in
                            Color.clear
                                .onAppear { /// 2.
                                    coachmarkHeight = proxy.size.height
                                }
                        }
                    )
                }
                .position(x: _frame.midX, y: _frame.midY + (coachmarkHeight/2) + (_size.height/2) + 5 )
            }.offset(x: _frame.midX * -1 + (_size.width/2), y: _frame.midY * -1 + (_size.height/2))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        } else {
            Rectangle().fill(Color.clear)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}
