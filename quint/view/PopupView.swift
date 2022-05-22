//
//  PopupView.swift
//  quint
//
//  Created by Rinaldi Alfian on 19/05/22.
//

import SwiftUI

struct PopupViewModifier: ViewModifier {
    var onTapoutside: () -> Void
    var withCloseBtn: Bool
    @State var popUpHeight : CGFloat = 0
    @State var isShow: Bool = true
    @State var y: CGFloat = 0
    
    
    func body(content: Content) -> some View {
        ZStack{
            Rectangle()
                .fill(.gray)
                .opacity(0.3)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .onTapGesture {
                    onTap()
                    
                    withAnimation(.linear(duration: 0.2) ){
                        y = popUpHeight
                    }
                }
            
            VStack{
                Spacer()
                VStack{
                    if(withCloseBtn) {
                        HStack{
                            Spacer()
                            Button(action: {
                                onTap()
                                withAnimation(.linear(duration: 0.2) ){
                                    y = popUpHeight
                                }
                            }, label: {
                                Image("closeRoundGray")
                            })
                            
                        }.padding(20)
                    }
                    content
                }.frame(width: UIScreen.main.bounds.width, height: 502, alignment: .center)
                    
                    .background(
                        GeometryReader { proxy in
                            Color.white
                                .onAppear { /// 2.
                                    popUpHeight = proxy.size.height
                                    y = popUpHeight
                                }
                        }
                    )
                    .cornerRadius(22, corners: [.topLeft, .topRight])
                    .offset(y: y)
                
            }
            
        }.ignoresSafeArea().zIndex(1)
            .onAppear{
                withAnimation(.linear(duration: 0.2).delay(0.15)){
                    y = 0
                }
            }
    }
    
    func onTap() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            onTapoutside()
        }
    }
}


