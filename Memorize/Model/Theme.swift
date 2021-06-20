//
//  Theme.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 20/06/2021.
//

import Foundation
import SwiftUI

struct Theme {

    var name: String
    var emojiSet: [String]
    var color: UIColor
    var numberOfPairsOfCards: Int {
        emojiSet.count * 2
    }
    
    var emojiCount: Int {
        (numberOfPairsOfCards + 1) / 2
    }
}
