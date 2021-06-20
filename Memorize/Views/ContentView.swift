//
//  ContentView.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 17/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                        ForEach(viewModel.cards) { card in
                            CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        viewModel.choose(card)
                                    }
                                }
                        }
                    }
                })
                Text("Score: \(viewModel.score())")
                    .foregroundColor(.black)
                    .font(.title)
            }
            .foregroundColor(.init(viewModel.currentTheme().color))
            .navigationBarTitle(viewModel.currentTheme().name, displayMode: .inline)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("New Game") {
                        viewModel.newGame()
                    }
                }
                
            })
            
            
        }
        
        .padding()
    }
}




struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
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
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
