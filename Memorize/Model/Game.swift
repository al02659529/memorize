//
//  Game.swift
//  Memorize
//
//  Created by Daniel Alejandro Rosales Lopez on 11/08/21.
//

import Foundation

struct Game {
    
    private(set) var cards: [Card]
    var score = 0
    var isGameOver = false
    var theme: Theme
    var choosenCardIndex: Int?

    init(theme: Theme) {
        cards = []
        self.theme = theme
        startTheme()
    }

    mutating func startTheme() {
        cards = []
        var contentItems: [String] = []
        while contentItems.count != theme.numberOfPairs {
            let randomElement = theme.emojis.randomElement()!
            if !contentItems.contains(randomElement) {
                contentItems.append(randomElement)
            }
        }
        let secondContentItems: [String] = contentItems.shuffled()
        for index in 0..<theme.numberOfPairs {
            cards.append(Card(id: index*2, content: contentItems[index]))
            cards.append(Card(id: index*2+1, content: secondContentItems[index]))
        }
    }

    mutating func chooseCard(_ card: Card) {
        print(card)
        if let foundIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[foundIndex].isFaceUp,
           !cards[foundIndex].isMatchedUp
        {
            if let potentialMatchIndex = choosenCardIndex {
                if cards[foundIndex].content == cards[potentialMatchIndex].content {
                    cards[foundIndex].isMatchedUp = true
                    cards[potentialMatchIndex].isMatchedUp = true
                }
                choosenCardIndex = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                choosenCardIndex = foundIndex
            }
            cards[foundIndex].isFaceUp.toggle()
        }
        print(card)
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



    struct Card: Identifiable {
        
        
            
            
            var id: Int
            var isFaceUp: Bool = false
            var content: String
            var isMatchedUp: Bool = false
            var isPreviouslySeen = false
        }

    }
