//
//  MemoryGame.swift
//  Lab 3_Becca Berger
//
//  Created by Becca Berger on 11/5/25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: [Card]
    
    // MARK: - Card Logic
    private var indexOfTheOneAndOnlyFaceUpCard: Int?

    mutating func chooseCard(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // there is one up already → check match
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                // turn everything face down first
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }

            cards[chosenIndex].isFaceUp.toggle()
        }
    }

    // MARK: - Initialization
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfPairsOfCards {
            let content = contentFactory(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
        cards.shuffle()
    }

    // MARK: - Card Struct
    struct Card: Identifiable {
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
    }
}
