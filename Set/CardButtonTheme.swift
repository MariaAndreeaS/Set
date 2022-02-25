//
//  CardButtonTheme.swift
//  Set
//
//  Created by Maria Andreea on 23.02.2022.
//

import Foundation
import UIKit

class CardButtonTheme : UIButton{

   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var cardIsSelected: Bool   = false
    var card: Card?

    private let shapes  = ["▲", "●", "■"]
    private let colors: [UIColor] = [UIColor.blue, UIColor.green, UIColor.magenta]
    private let fills : [CGFloat] = [-5, -5, -5]

}


