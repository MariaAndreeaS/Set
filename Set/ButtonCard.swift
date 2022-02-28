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

        private let shapes  = ["▲", "●", "■"]
        private let colors: [UIColor] = [UIColor.cyan, UIColor.blue,UIColor.magenta]
        private let fills : [CGFloat] = [1.0, 0.5, 0.1]

        func update() {
            if let card = self.card {
                let shape       = shapes[card.shape]
                let shapesArray = Array(repeating: shape, count: card.number)
                let color       = colors[card.color]
                let fill        = fills[card.fill]
                let attributes: [NSAttributedString.Key: Any] = [
                    .strokeWidth    : -11.0,
                    .strokeColor    : color,
                    .foregroundColor: color.withAlphaComponent(fill)
                ]
                let attributed = NSAttributedString(string: shapesArray.joined(separator: "\n"), attributes: attributes)
                setAttributedTitle(attributed, for: UIControl.State.normal)
           }
        }
    }
    extension Array {
        subscript(_ value: Card.Version) -> Element {
            return self[(value.rawValue - 1)]
        }
}
