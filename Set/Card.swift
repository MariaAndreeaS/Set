//
//  Card.swift
//  Set
//
//  Created by Maria Andreea on 23.02.2022.
//

import Foundation

struct Card: Hashable
{
//    Card's unique identifier
    private(set) var identifier: Int
    // Card's attributes
    let number  : Int
    let shape   : Version
    let color   : Version
    let fill    : Version

    init(number: Int, shape: Version, color: Version, fill: Version) {
        // Setting unique identifier for card
        self.identifier = Card.getUniqueIdentifier()
        self.number     = number
        self.shape      = shape
        self.color      = color
        self.fill       = fill
    }
    enum Version: Int {
        case c1 = 1, c2, c3
    }
    private static var identifierFactory = 0

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}

