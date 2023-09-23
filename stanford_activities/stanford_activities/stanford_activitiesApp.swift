//
//  stanford_activitiesApp.swift
//  stanford_activities
//
//  Created by Thiago Machado Cunha on 17/09/2023.
//

import SwiftUI

@main
struct stanford_activitiesApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
