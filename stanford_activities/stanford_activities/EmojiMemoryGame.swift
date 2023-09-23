//
//  EmojiMemoryGame.swift
//  stanford_activities
//
//  Created by Thiago Machado Cunha on 23/09/2023.
//

import SwiftUI

// Needs to make the signning of mutations by adding the Observable
class EmojiMemoryGame: ObservableObject {
    // things are not sequencially initialized, static makes it global, globals are initialized first
    private static let emojis = ["🐝", "🐞", "🕷️", "🦆","🫎", "🪰", "🦕", "🦟" ,"🕊️", "🦩", "🦝", "🐿️"]
    
    // return are not implicitly defined, needs to be typed
    private static func createMemoryGame() -> MemoryGame<String> {
        return  MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    // the gatekeeper has access only, also alerts when something changes
    @Published private var model = createMemoryGame()
    
    // 
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intent
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
