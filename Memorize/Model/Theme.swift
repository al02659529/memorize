//
//  Theme.swift
//  Memorize
//
//  Created by Daniel Alejandro Rosales Lopez on 11/08/21.
//

import Foundation
import UIKit

struct Theme: Equatable {
    
    static func == (lhs: Theme, rhs: Theme) -> Bool {
        return lhs.name == rhs.name
    }
    
    
    internal init(name: String, emojis: [String], numberOfPairs: Int, cardsColor: UIColor) {
        self.name = name
        self.emojis = Array(Set(emojis))
        
        if(numberOfPairs > emojis.count || numberOfPairs < 1) {
            self.numberOfPairs = emojis.count
        } else {
            self.numberOfPairs = numberOfPairs
        }
        self.cardsColor = cardsColor
    }
    
    var name: String
    var emojis: [String]
    var numberOfPairs: Int
    var cardsColor: UIColor
    
    
    
}
