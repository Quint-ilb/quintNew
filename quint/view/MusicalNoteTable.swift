//
//  MusicalNoteTable.swift
//  quint
//
//  Created by Zakki Mudhoffar on 19/05/22.
//

import SwiftUI

struct MusicalNoteTable: View {
    
    var musical : MusicalNote
    
    var body: some View {
            HStack{
                HStack{
//                    Text("\(musical.exercise?.name ?? "")")
                    Image(musical.image)
                        .resizable()
                        .frame(width: 55, height: 55)
                    Text(musical.name)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                    
                    Spacer()
                    
                    HStack(alignment:.lastTextBaseline){
                        LockCircleView()
                    }
                }
            }
        
    }
}

//struct MusicalNoteTable_Previews: PreviewProvider {
//    static var previews: some View {
//        MusicalNoteTable(musical: MusicalNote(id: "", name: "Name", image: "Image"), rootIsActive: <#Binding<Bool>#>)
//    }
//}
