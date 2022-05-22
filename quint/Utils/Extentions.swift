//
//  Extentions.swift
//  quint
//
//  Created by Widya Limarto on 19/05/22.
//

import Foundation
import SwiftUI

extension Color {
    static let primaryColor = Color("primaryColor")
    static let primaryLightColor = Color("primaryLightColor")
    static let secondaryColor = Color("secondaryColor")
    static let secondaryLightColor = Color("secondaryLightColor")
    static let grayFColor = Color("grayFColor")
    static let grayEColor = Color("grayEColor")
}


struct MyCustomTapHandler: ViewModifier {
    var onTap: () -> Void
    func body(content: Content) -> some View {
        content
        //Add the onTap to the whole View
        //            .onTapGesture {
        //                myCustomTapHandler()
        //            }
            .gesture(LongPressGesture().onChanged { _ in onTap() })
    }
}

extension View {
    func myCustomTapHandler(callback: @escaping () -> Void) -> some View {
        modifier(MyCustomTapHandler(onTap: callback))
    }
}

extension View {
    func myCustomPopUp(onTapoutside: @escaping () -> Void, withCloseBtn: Bool = false) -> some View {
        modifier(PopupViewModifier(onTapoutside: onTapoutside, withCloseBtn: withCloseBtn))
    }
}



extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

func reader(isShowCoachmark: Bool, type: CoachmarkType, coachmarkManager: CoachmarkManager) -> some View {
    return GeometryReader { (geometry) -> AnyView in
        AnyView(CoachmarkView(_frame: geometry.frame(in: CoordinateSpace.global), _size: geometry.size, coachMarkManager: coachmarkManager, isShowCoachmark: isShowCoachmark))
    }
}
