//
//  ContentView.swift
//  stanford_activities
//
//  Created by Thiago Machado Cunha on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
        
    }
}

struct CardView: View {
    // @State creates a pointer to the variable allowing it to be modified at the closured 'onTapGesture'
    // since structs can only be modified inside its main scope
    @State var isFaceUp: Bool = false    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // let means constant
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("😇").font(.largeTitle)

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
