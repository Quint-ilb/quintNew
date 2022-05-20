//
//  RhythmView.swift
//  quint
//
//  Created by Rinaldi Alfian on 20/05/22.
//

import SwiftUI

struct RhythmView: View {
  
    var body: some View {
        ZStack {
            Color(red: 239/255, green: 241/255, blue: 245/255).edgesIgnoringSafeArea(.all)
            
            Image("rhythm1").cornerRadius(20).padding()
            Image("rhythm2").cornerRadius(20).padding()
            Image("rhythm3").cornerRadius(20).padding()
            Image("rhythm4").cornerRadius(20).padding()
            Image("rhythm5").cornerRadius(20).padding()
        }
        
    }
}

//var RhythmOnList = [
//    RhythmList(id: 1, Image: "rhythm1"),
//    RhythmList(id: 2, Image: "rhythm2"),
//    RhythmList(id: 3, Image: "rhythm3"),
//    RhythmList(id: 4, Image: "rhythm4"),
//    RhythmList(id: 5, Image: "rhythm5")
//]

struct RhythmView_Previews: PreviewProvider {
    static var previews: some View {
        RhythmView()
    }
}
//struct pageRhythm: UIViewRepresentable {
//    func makeUIView(context: UIViewRepresentableContext<pageRhythm>) -> pageRhythm.UIViewType {
//
//    }
//    func updateUIView(_ uiView: pageRhythm.UIViewType, context: UIViewRepresentableContext<pageRhythm>) {
//
//    }
//}
