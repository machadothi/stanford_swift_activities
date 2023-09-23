//
//  EmojiMemoryGameView.swift
//  stanford_activities
//
//  Created by Thiago Machado Cunha on 17/09/2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: 0)], spacing: 0) {
            // ForEach(emojis.indices, id: \.self) { index in
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }.foregroundColor(.orange)
    }

}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // let means constant
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base.opacity(card.isFaceUp ? 0 : 1)
            
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
}

















struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
