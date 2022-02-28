//
//  DeckCards.swift
//  Set
//
//  Created by Maria Andreea on 24.02.2022.
//

import Foundation
import UIKit

struct DeckCards
{
    var cards: [Card]

    var count: Int { return self.cards.count }

    init() {
        self.cards = DeckCards.makeCard()
    }

    private static func makeCard() ->[Card] {
        let attributes = DeckCards.cardsAttributes([Card.Version.c1, Card.Version.c2, Card.Version.c3], count: 4)
        return attributes.map { Card(number: $0[0].rawValue, shape: $0[1], color: $0[2], fill: $0[3]) }.shuffled()
    }
    private static func cardsAttributes<T>(_ options: [T], count: Int) -> [[T]] {
        guard options.count >= 0 && count > 0 else { return [[]] }
        var atrrb = [[T]]()
        for option in options {
            atrrb += cardsAttributes(options, count: count - 1).map {[option] + $0}
        }
        return atrrb
    }
}


