//
//  quintApp.swift
//  quint
//
//  Created by Widya Limarto on 13/05/22.
//

import SwiftUI

@main
struct quintApp: App {
    var body: some Scene {
        WindowGroup<ContentView> {
            ContentView(musicNM: MusicalNoteModel())
        }
    }
}
