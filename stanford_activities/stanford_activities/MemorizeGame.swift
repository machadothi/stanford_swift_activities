//
//  MemorizeApp.swift
//  stanford_activities
//
//  Created by Thiago Machado Cunha on 23/09/2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    // only the model can change its value, but value can be consulted by others
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        // cards = [Card]() same thing
        cards = []
        // add the pairs
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            var faceUpCardIndices = cards.indices.filter{index in cards[index].isFaceUp}
            
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set {
            cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0)}
        }
    }
    
    mutating func choose(_ card: Card) {
        print(card)
        
        if let chosenIndex =  cards.firstIndex(where: { $0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potencialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potencialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potencialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomStringConvertible {
        
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var description: String { "|\(id)| : |\(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")|"}
    }
}
