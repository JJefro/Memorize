//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 18/06/2021.
//

import SwiftUI


class EmojiMemoryGame {
    
    static var emojis = ["🛵", "🚓", "🚁", "🛺", "🚲", "🚗", "🚜", "🚡", "🚀", "🛥", "✈️", "🚑", "🛴", "🚢",  "🚔", "🚘", "🚙", "🚎", "🚛", "🏎", "🛫", "🚕", "🚚", "🚐",]
    
    static func createMemoryGame() -> MemoryGame<String> {
        
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
