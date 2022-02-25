//
//  Card.swift
//  Set
//
//  Created by Maria Andreea on 23.02.2022.
//

import Foundation


struct Card : Hashable
{
    //true if card is selected
    var cardIsSelected: Bool   = false

    //card's attributes
    var number: Int
    var color: Version
    var shape: Version
    var fill: Version
    private(set) var identifier : Int

    private static var identifierFactory = 0

    //unique identifier for card
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }

    init(number: Int,color: Version,shape: Version, fill: Version) {
        // Setting unique identifier for card
        self.identifier = Card.getUniqueIdentifier()
        self.number     = number //number of figures
        self.shape      = shape
        self.color      = color
        self.fill       = fill
    }

    enum Version: Int {
        case v1 = 1,v2,v3
    }
}

