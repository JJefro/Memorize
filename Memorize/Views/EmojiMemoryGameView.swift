//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 17/06/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                        ForEach(game.cards) { card in
                            CardView(card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        game.choose(card)
                                    }
                                }
                        }
                    }
                })
                Text("Score: \(game.score())")
                    .foregroundColor(.black)
                    .font(.title)
            }
            .foregroundColor(.init(game.currentTheme().color))
            .navigationBarTitle(game.currentTheme().name, displayMode: .inline)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("New Game") {
                        game.newGame()
                    }
                }
            })
        }
        .padding()
    }
}




struct CardView: View {
    
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
