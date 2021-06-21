//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 17/06/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
