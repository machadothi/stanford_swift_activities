//
//  ContentView.swift
//  stanford_activities
//
//  Created by Thiago Machado Cunha on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐝", "🐞", "🕷️", "🦆","🫎", "🪰", "🦕", "🦟" ,"🕊️", "🦩", "🦝", "🐿️"  ] // [String] = Array<String>
    
    @State var cardCount = 4 // Don't use @State in real code, not a good practice
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(0..<cardCount, id: \.self) { index in // ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }.foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill") // implicit 'return' cause of function or scope with single instruction
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill") // implicit 'return' cause of function or scope with single instruction
    }
        

}

struct CardView: View {
    // @State creates a pointer to the variable allowing it to be modified at the closured 'onTapGesture'
    // since structs can only be modified inside its main scope
    @State var isFaceUp: Bool = false
    
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // let means constant
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 0 : 1)
            
            base.opacity(isFaceUp ? 1 : 0)
            
        }.onTapGesture(perform: {
            isFaceUp.toggle()
        })
    }
    
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
