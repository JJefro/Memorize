//
//  ArrayExtensions.swift
//  Memorize
//
//  Created by Jevgenijs Jefrosinins on 29/06/2021.
//

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
