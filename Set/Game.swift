import Foundation
import UIKit

struct Game
{
    private var deck: DeckCards

    private(set) var selected = [Card]()
    private(set) var cardsMatched = [Card]()
    private(set) var removed = [Card]()

    var score = 0

    init() {
        self.deck = DeckCards()
        self.cardsInGame = takeCardsFromDeck(amount: 12)
    }
    var numberOfCardsInDeck: Int { return deck.count }

    private(set) var gameMatchState: StateOfCards = .notSet

    private(set) var cardsInGame = [Card?]()

    mutating func deal(_ amount: Int) {
        if gameMatchState == .cardsAreMatched {
            cleanAfterMatchingCards()
        } else {
            let cards = takeCardsFromDeck(amount: amount)
            cardsInGame += cards
        }
    }

    mutating func takeCardsFromDeck(amount: Int) -> [Card] {
        var cards = [Card]()
        for _ in 0..<amount {
            cards.append(deck.cards.removeFirst())
        }
        return cards
    }

    mutating func remove(){
        cardsInGame.removeAll()
        self.deck = DeckCards()
        deal(12)
    }

    //check if cards are set
      func checkSetCards(selected: [Card]) -> Bool {
        guard selected.count == 3 else { return false }
        guard ((selected[0].color.rawValue + selected[1].color.rawValue + selected[2].color.rawValue) % 3 == 0) else { return false }
        guard ((selected[0].shape.rawValue + selected[1].shape.rawValue + selected[2].shape.rawValue) % 3 == 0) else { return false }
        guard ((selected[0].number + selected[1].number + selected[2].number) % 3 == 0) else { return false }
        guard ((selected[0].fill.rawValue + selected[1].fill.rawValue + selected[2].fill.rawValue) % 3 == 0) else { return false }
        return true

        }


    mutating func chooseCard(_ card : Card){
        if !selected.contains(card) {
            if selected.count < 2
            {
                selected.append(card)
            }
            else if selected.count == 2
            {
                selected.append(card)
                if checkSetCards(selected: selected){ // if checkSetCards is true
                    //add to cardsMatched the contents of selected cards(selected)
                    score+=3
                    cardsMatched += selected
                    gameMatchState = .cardsAreMatched
                }
                else if !checkSetCards(selected: selected){
                    score-=5
                }
            }
            else if selected.count == 3
            {
                cleanAfterMatchingCards()
                selected.append(card)
            }
        } else {
           if let cardIndex = selected.firstIndex(of: card) {
            selected.remove(at: cardIndex)
           }
        }
    }

    private mutating func cleanAfterMatchingCards() {

        if numberOfCardsInDeck > 0 {
            let newCards = takeCardsFromDeck(amount: 3)
            cardsInGame.replaceCards(cardsElements: cardsMatched, with: newCards)
        } else {
            cardsInGame.removeCards(elements: cardsMatched)
        }
        selected.removeAll()
        cardsMatched.removeAll()
        gameMatchState = .notSet
    }

    enum StateOfCards {
        case cardsAreMatched
        case cardsAreNotMatched
        case notSet
    }
}


extension Array where Element: Equatable {
    //replace a card
    mutating func replaceCards(cardsElements: [Element], with newCardsElements: [Element]) {
        guard cardsElements.count == newCardsElements.count else { return }
        for index in 0..<newCardsElements.count {
            if let matchedIndex = self.firstIndex(of: cardsElements[index]) {
                self[matchedIndex] = newCardsElements[index]
            }
        }
    }
   //remove card
    mutating func removeCards(elements: [Element]){
         self = self.filter { !elements.contains($0) }
    }
}
