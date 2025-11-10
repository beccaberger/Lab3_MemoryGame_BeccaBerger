//
//  ContentView.swift
//  Lab 3_Becca Berger
//
//  Created by Becca Berger on 11/5/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DogMemoryGame()
    
    var body: some View {
        VStack {
            Text("🐶 Dog Memory Game 🐶")
                .font(.largeTitle)
                .padding()

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(viewModel.cards) { card in
                    DogCardView(card: card)
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture { viewModel.choose(card) }
                }
            }
            .padding()
        }
    }
}

import SwiftUI

struct DogCardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)

            if card.isFaceUp || card.isMatched {
                shape.fill(.white)
                shape.stroke(.blue, lineWidth: 3)
                Image(card.content)
                    .resizable()
                    .scaledToFit()
                    .padding(6)
            } else {
                shape.fill(.blue)
            }
        }
        .opacity(card.isMatched ? 0 : 1)
        .scaleEffect(card.isMatched ? 0.5 : 1)
        .animation(.easeInOut(duration: 0.35), value: card.isMatched)
            
    }
}

