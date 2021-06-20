//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 18/06/2021.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static var emojis = ["🛵", "🚓", "🚁", "🛺", "🚲", "🚗", "🚜", "🚡", "🚀", "🛥", "✈️", "🚑", "🛴", "🚢",  "🚔", "🚘", "🚙", "🚎", "🚛", "🏎", "🛫", "🚕", "🚚", "🚐",]
    
    static func createMemoryGame() -> MemoryGame<String> {
        
        MemoryGame<String>(numberOfPairsOfCards: (emojis.count + 1) / 2) { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }

    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
