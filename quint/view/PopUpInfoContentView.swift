//
//  PopUpInfoContentView.swift
//  quint
//
//  Created by Widya Limarto on 21/05/22.
//

import SwiftUI

struct PopUpInfoContentView: View {
    var data : [PopUpInfo]
    @State var popUpInfoIndex: Int = 0
    
    var onTapClose : () -> ()
    
    var body: some View {

        VStack {
            HStack{
                Spacer()
                Button(action: {
                    onTapClose()
                }, label: {
                    Image("closeRoundGray")
                })
                
            }
            ScrollView{
                
                VStack {
                    Image(data[popUpInfoIndex].image)
                    Text(data[popUpInfoIndex].title)
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 45)
                        .padding(.top, 10)
                    Text(data[popUpInfoIndex].description)
                        .font(.system(size: 15, weight: .regular))
                }
            }
            
            Spacer()
            HStack{
                Button(action: {
                    if popUpInfoIndex == 1 {
                        popUpInfoIndex = 0
                    }
                }, label: {
                    Image("prevInfo")
                }).disabled(popUpInfoIndex == 0)
                    
                Spacer()
                Button(action: {
                    if popUpInfoIndex == 0 {
                        popUpInfoIndex = 1
                    }
                }, label: {
                    Image("nextInfo")
                }).disabled(popUpInfoIndex == 1)
            }
        }.padding(24)
    }
}

struct PopUpInfoContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpInfoContentView(data: Config.tapExercises[0].info, onTapClose: {})
    }
}
