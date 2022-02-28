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
    private lazy var game = Game()

    @IBOutlet var cardB: [ButtonCard]!

    private func updateUIfromModel() {
        for index in cardB.indices {
            let btn=cardB[index]
            if index < game.cardsInGame.count {
                guard let card = game.cardsInGame[index] else { return }
                btn.card = card
            } else {
                btn.card = nil
            }
        }
    }
}
