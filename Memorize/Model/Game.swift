//
//  Game.swift
//  Memorize
//
//  Created by Daniel Alejandro Rosales Lopez on 11/08/21.
//

import Foundation

struct Game {
    
    var themes: [Theme]
    var cards: [Any]
    var score = 0
    var isGameOver = false
    var choosenTheme: Theme
    
    init(themes: [Theme]) {
        self.themes = themes
        self.choosenTheme = self.themes.randomElement()!
        cards = []
        startNewTheme()
    }
    
    mutating func startNewTheme() {
        print(choosenTheme)
        choosenTheme = getNewTheme()
        print(choosenTheme)
        cards = []
        var contentItems: [String] = []
        while contentItems.count != choosenTheme.numberOfPairs {
            let randomElement = choosenTheme.emojis.randomElement()!
            if !contentItems.contains(randomElement) {
                contentItems.append(randomElement)
            }
        }
        let secondContentItems: [String] = contentItems.shuffled()
        for index in 0..<choosenTheme.numberOfPairs {
            cards.append(Card(id: index*2, content: contentItems[index]))
            cards.append(Card(id: index*2+1, content: secondContentItems[index]))
        }
    }
    
    func getNewTheme() -> Theme {
        let themesIndexes: [Int] = Array(0..<themes.count)
        var visitedIndexes: [Int] = []
        
        while(visitedIndexes.count < themesIndexes.count) {
            let randomIndex = Int.random(in: 0..<themes.count)
            let newTheme = themes[randomIndex]
            if newTheme == choosenTheme {
                visitedIndexes.append(randomIndex)
            } else {
                return newTheme
            }
        }
        return themes[0]
    }
   
    mutating func endGame() {
        isGameOver = true
    }
    
    mutating func penalizePoints() {
        score -= 1
    }
    
    mutating func awardPoints () {
        score += 2
    }
    
    
    
    struct Card: Identifiable, Equatable {
        static func == (lhs: Game.Card, rhs: Game.Card) -> Bool {
            return lhs.content == rhs.content
        }
        
        var id: Int
        var isFaceUP: Bool = false
        var content: String
        var isMatchedUP: Bool = false
        var isPreviouslySeen = false
    }
    
}
