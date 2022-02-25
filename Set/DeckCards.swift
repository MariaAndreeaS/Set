//
//  DeckCards.swift
//  Set
//
//  Created by Maria Andreea on 24.02.2022.
//

import Foundation


struct DeckCards{

    var cards = [Card]()

    var count : Int{
        return self.cards.count //return number of cards in deck
    }

    init(){
        self.cards=DeckCards.makeDeck() //81 cards in deck
    }

    private static func makeDeck() ->[Card] {
        let attributes = DeckCards.attributes([Card.Version.v1, Card.Version.v2, Card.Version.v3])
        //map with cards attributes
        return attributes.map { Card(number: $0[0].rawValue, color: $0[1], shape: $0[2], fill: $0[3]) }
    }

    //create an array with cards attributes: nr of figures,shape, fill..
    private static func attributes<Element>(_ options: [Element]) -> [[Element]] {
        var cardElements = [[Element]]()
        for option in options {
            cardElements += attributes(options).map {[option] + $0}
        }
        return cardElements
    }
}

