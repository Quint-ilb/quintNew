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
