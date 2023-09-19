//
//  ContentView.swift
//  stanford_activities
//
//  Created by Thiago Machado Cunha on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis: [String] = ["🐝", "🐞", "🕷️", "🦆" ] // [String] = Array<String>
        VStack{
            HStack {
                ForEach(emojis.indices, id: \.self) { index in // ForEach(0..<4, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack {
                CardView(content: "🐷")
                CardView(content: "🪿")
                CardView(content: "🐺")
                CardView(content: "🦇")
            }
            .foregroundColor(.orange)
            
            HStack {
                CardView(content: "🐞")
                CardView(content: "🦎")
                CardView(content: "🦑")
                CardView(content: "🐙")
            }
            .foregroundColor(.orange)
            
        }.padding()
        
    }
}

struct CardView: View {
    // @State creates a pointer to the variable allowing it to be modified at the closured 'onTapGesture'
    // since structs can only be modified inside its main scope
    @State var isFaceUp: Bool = true
    
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // let means constant
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)

            } else {
                base.fill() // fill is implicitly called
            }
            
        }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            isFaceUp.toggle()
        })
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
