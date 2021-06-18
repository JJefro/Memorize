//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 18/06/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    func choose(card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        
        //add numberOfPairsOfCards x2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent //Generic. "Don't care" type.
    }
}
