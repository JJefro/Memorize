//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 18/06/2021.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    static var currentTheme: Theme = themeVehicles
    
    static var gameScore = 0
    
    private static let emojisVehicles = ["🛵", "🚓", "🚁", "🛺", "🚲", "🚗", "🚜", "🚡", "🚀", "🛥", "✈️", "🚑", "🛴", "🚢",  "🚔", "🚘", "🚙", "🚎", "🚛", "🏎", "🛫", "🚕", "🚚", "🚐",]
    
    private static let emojisHelloween = ["👺", "🎃", "👻", "🍭", "🧛🏽‍♂️", "😱", "🕷", "🧙🏼", "👹", "🤯", "💀", "👁", "🦄", "🧟‍♂️"]
    
    private static let emojisAnimals = ["🐈", "🐕", "🦝", "🐮", "🐷", "🦔", "🐿", "🐇", "🐃", "🦘", "🐌", "🐑", "🐘", "🐆", "🐒", "🦌", "🦛", "🦅", "🦜", "🐓", "🦍", "🐀", "🦓", "🧸"]
    
    private static let emojisFlowers = ["🌹", "💐", "🌸", "🌺", "🌷", "🌻", "🌼", "🥀", "💮"]
    
    private static let emojisProfession = ["👩🏻‍💼", "🕵🏻‍♀️", "👩🏻‍🏭", "👩🏻‍🔧", "👩🏽‍🚒", "👮🏾‍♀️", "👩🏼‍💻", "🧑🏽‍✈️", "👩🏼‍🏫", "💂🏽", "👨🏽‍🍳", "👩🏼‍⚖️", "👨🏻‍🎨", "👷🏼‍♂️", "👨🏼‍⚕️"]
    
    private static let emojisSport = ["🤺", "🚵🏼‍♀️", "⛹🏼", "🏄🏻", "🤾🏼", "🏋🏼‍♀️", "🚣🏼", "⛹🏻‍♂️", "🏂", "🏋🏽", "🏌🏼‍♂️", "🤽🏼", "🏊🏼‍♂️", "🥊", "⛷", "🏇🏼"]
    
    private static let themeVehicles = Theme(name: "Vehicles", emojiSet: emojisVehicles, color: #colorLiteral(red: 1, green: 0.05480351299, blue: 0.1303174794, alpha: 1))
    private static let themeHelloween = Theme(name: "Helloween", emojiSet: emojisHelloween, color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
    private static let themeAnimals = Theme(name: "Animals", emojiSet: emojisAnimals, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    private static let themeFlowers = Theme(name: "Flowers", emojiSet: emojisFlowers, color: #colorLiteral(red: 1, green: 0.4942817092, blue: 0.7969098687, alpha: 1))
    private static let themeProfessions = Theme(name: "Professions", emojiSet: emojisProfession, color: #colorLiteral(red: 0.1329128742, green: 0.1723157465, blue: 1, alpha: 1))
    private static let themeSport = Theme(name: "Sport", emojiSet: emojisSport, color: #colorLiteral(red: 1, green: 0.8205828667, blue: 0, alpha: 1))
    
    private static let themes = [themeVehicles, themeHelloween, themeAnimals, themeFlowers, themeProfessions, themeSport]
    
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        
        MemoryGame<String>(numberOfPairsOfCards: EmojiMemoryGame.currentTheme.emojiCount / 2) { pairIndex in
            EmojiMemoryGame.currentTheme.emojiSet[pairIndex]
        }
    }

    @Published private var model = createMemoryGame()
    
    var cards: [Card] {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: Card) {
        objectWillChange.send()
        model.choose(card)
    }

    func newGame() {
        EmojiMemoryGame.currentTheme = randomTheme()
        model = EmojiMemoryGame.createMemoryGame()
        EmojiMemoryGame.gameScore = 0
    }
    
    func currentTheme() -> Theme {
        return EmojiMemoryGame.currentTheme
    }
    
    func randomTheme() -> Theme {
        if let randomTheme = EmojiMemoryGame.themes.randomElement() {
            EmojiMemoryGame.currentTheme = randomTheme
        }
        return EmojiMemoryGame.currentTheme
    }
    
    func score() -> Int {
        return EmojiMemoryGame.gameScore
    }
    
}
