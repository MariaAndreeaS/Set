//
//  ButtonCard.swift
//  Set
//
//  Created by Maria Andreea on 28.02.2022.
//

import UIKit

class ButtonCard: UIButton {

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        var card: Card?
        {
            didSet {
                self.update()
            }
        }

    //Returns true if card is selected
    var cardSelected: Bool   = false
    
 
     var stateofCards: Game.StateOfCards = .notSet {
        didSet {
            switch stateofCards {
            case .cardsAreMatched:
                self.layer.borderColor = UIColor.green.cgColor
                self.layer.borderWidth = 3
            case .cardsAreNotMatched:
                self.layer.borderColor = UIColor.red.cgColor
                self.layer.borderWidth = 3
            case .notSet:
                self.layer.borderColor = UIColor.white.cgColor
                self.layer.borderWidth = 3
            }
        }
     }
    
        let shapes  = ["▲", "●", "■"]
        let colors: [UIColor] = [UIColor.green, UIColor.blue,UIColor.magenta]
        let fills : [CGFloat] = [1.0, 0.5, 0.1]

        func update() {
            if let card = self.card {
                let shape       = shapes[card.shape]
                let shapesArray = Array(repeating: shape, count: card.number)
                let color       = colors[card.color]
                let fill        = fills[card.fill]

                let attributes: [NSAttributedString.Key: Any] = [
                    .strokeWidth    : -11.0,
                    .strokeColor    : color,
                    .foregroundColor: color.withAlphaComponent(fill),
                ]

                let attributed = NSAttributedString(string: shapesArray.joined(separator: "\n"), attributes: attributes)
                setAttributedTitle(attributed, for: UIControl.State.normal)
                self.backgroundColor   = cardSelected ? UIColor.systemGray2 : UIColor.white
                self.isHidden=false
           }
            else{
                let attributed = NSAttributedString(string: " ", attributes: nil)
                setAttributedTitle(attributed, for: UIControl.State.normal)
                self.setTitle("", for: UIControl.State.normal)
                self.cardSelected = false
                self.stateofCards = .notSet
                self.isHidden=true
            }
        }
    }
    extension Array {
        subscript(_ value: Card.Version) -> Element {
            return self[(value.rawValue - 1)]
        }
}
