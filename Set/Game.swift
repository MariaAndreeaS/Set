import Foundation

struct Game
{
    private var deck: DeckCards

    init() {
        self.deck = DeckCards()
        self.cardsInGame = takeCardsFromDeck(amount: 12)
    }
    var numbederOfCardsInDeck: Int { return deck.count }

    private(set) var cardsInGame = [Card?]()

    mutating func deal(_ amount: Int) {
            let cards = takeCardsFromDeck(amount: amount)
            cardsInGame += cards
    }

    private mutating func takeCardsFromDeck(amount: Int) -> [Card] {
        var cards = [Card]()
        for _ in 1...amount {
            cards.append(deck.cards.removeFirst())
        }
        return cards
    }
}
