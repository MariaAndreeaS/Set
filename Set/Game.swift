//
//  Game.swift
//  Set
//
//  Created by Maria Andreea on 23.02.2022.
//

import Foundation

struct Game{

    private var deckCards: DeckCards
    private(set) var cardsInGame = [Card?]()
    private(set) var matchedCards = [Card?]()
    private(set) var selectedCards=[Card]()

    init(){
        self.deckCards=DeckCards()
        //deal 12 cards to start
        self.cardsInGame=takeCardsFromDeck(amount: 12)
    }


    mutating func chooseCard(_ card:Card){
            if !selectedCards.contains(card)
            {
                selectedCards.append(card)
            }
            else{
                if let cardIndex = selectedCards.firstIndex(of: card) {
                    selectedCards.remove(at: cardIndex)
                }
            }
        if selectedCards.count == 3 && !selectedCards.contains(card) {
            // select card
            selectedCards.append(card)
        }
     }
    
    //deal with more cards
    mutating func deal(_ cards: Int) {
        let cards = takeCardsFromDeck(amount: cards)
        cardsInGame += cards
    }

    private mutating func takeCardsFromDeck(amount: Int) -> [Card] {
        var cards = [Card]()
        for _ in 1...amount {
            cards.append(deckCards.cards.removeFirst())
        }
        return cards
    }
}
