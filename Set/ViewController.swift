//
//  ViewController.swift
//  Set
//
//  Created by Maria Andreea on 23.02.2022.
//

import UIKit


class ViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIfromModel()
    }

    @IBOutlet weak var score: UILabel!

    private lazy var game = Game()
    
    @IBOutlet var cardB: [ButtonCard]!

    @IBOutlet var cardBb: [UIButton]!


    @IBOutlet weak var dealButton: UIButton!

    
    @IBAction func startNewGame(_ sender: UIButton) {
       game.remove()
       updateUIfromModel()
    }

    @IBAction func deallCards(_ sender: UIButton) {
        game.deal(3)

        updateUIfromModel()
    }

    @IBAction func touchCard(_ sender: ButtonCard) {
        guard let card = sender.card else { return }
        if sender.stateofCards == .notSet {
            game.chooseCard(card)
            updateUIfromModel()
        }
    }

    private func updateUIfromModel() {
        if game.cardsInGame.count == 0 || game.numberOfCardsInDeck == 0 {
            dealButton.isEnabled = true
        }
        score.text="Score \(game.score)"
        for index in cardB.indices {
            let btn = cardB[index]
            if index < game.cardsInGame.count {
                guard let card = game.cardsInGame[index] else { return }
                btn.cardSelected = game.selected.contains(card) ? true : false
                if game.cardsMatched.contains(card) {
                    btn.stateofCards = .cardsAreMatched
                } else if game.selected.count == 3 && btn.cardSelected{
                    btn.stateofCards = .cardsAreNotMatched
                } else{
                    btn.stateofCards = .notSet
                }
                btn.card = card
            } else
            {
                btn.card = nil
            }
      }
   }
}
