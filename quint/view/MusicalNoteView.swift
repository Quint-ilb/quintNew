//
//  MusicalNoteView.swift
//  quint
//
//  Created by Zakki Mudhoffar on 20/05/22.
//

import SwiftUI

struct MusicalNoteView: View {
    
    @ObservedObject var musicNM : MusicalNoteModel
    
    var body: some View {
        List {
            ForEach(musicNM.musicals){
                music in MusicalNoteTable(musical: music)
            }
        }
    }
}

struct MusicalNoteView_Previews: PreviewProvider {
    static var previews: some View {
        MusicalNoteView(musicNM: MusicalNoteModel())
    }
}
