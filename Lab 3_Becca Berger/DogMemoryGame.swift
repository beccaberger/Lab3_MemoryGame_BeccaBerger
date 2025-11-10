//
//  DogMemoryGame.swift
//  Lab 3_Becca Berger
//
//  Created by Becca Berger on 11/5/25.
//

import SwiftUI
import Combine  

class DogMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = DogMemoryGame.createGame()

    static func createGame() -> MemoryGame<String> {
        let breeds = [
            "Tosa", "Scottish Terrier", "Pharaoh Hound", "Norwegian Lundehund",
            "Mudi", "Leonberger", "Havanese", "Dutch Shepherd",
            "American Foxhound", "Airedale Terrier", "Pug", "Yorkshire Terrier"
        ]
        return MemoryGame(numberOfPairsOfCards: 6) { index in breeds[index] }
    }

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    func choose(_ card: MemoryGame<String>.Card) {
        withAnimation(.easeInOut(duration: 0.4)) {
            model.chooseCard(card)
        }
    }
}
