//
//  ViewController.swift
//  Set
//
//  Created by Maria Andreea on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }

    @IBAction func dealButton(_ sender: UIButton) {
        game.deal(3)
        updateViewFromModel()
    }

    @IBOutlet private var cardButtons: [UIButton]!

    @IBAction private func touchCard(_ sender: CardButtonTheme) {
        guard let card = sender.card else { return }
        game.chooseCard(card)
        updateViewFromModel()

    }
    private func updateViewFromModel(){

    }
}



