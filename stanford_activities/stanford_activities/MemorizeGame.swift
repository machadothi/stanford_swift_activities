//
//  MemorizeApp.swift
//  stanford_activities
//
//  Created by Thiago Machado Cunha on 23/09/2023.
//

import Foundation

struct MemoryGame<CardContent> {
    // only the model can change its value, but value can be consulted by others
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        // cards = [Card]() same thing
        cards = []
        // add the pairs
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}
