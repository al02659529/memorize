//
//  GameViewModel.swift
//  Memorize
//
//  Created by Daniel Alejandro Rosales Lopez on 11/08/21.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    static let numbersTheme = Theme(name: "WeirdNumbers", emojis: ["1", "2", "4", "9", "20", "30"], numberOfPairs: 6, cardsColor: .darkGray)
    
    static let emojisTheme = Theme(name: "Faces", emojis: ["🥰", "😄", "😜", "🥳", "🤓", "😎", "😋", "🤩"], numberOfPairs: 8, cardsColor: .blue)
    
    static let carsTheme = Theme(name: "Cars", emojis: ["🚓", "🏎️", "🚗", "🚎", "🚒", "🚙", "🚑", "🚌"], numberOfPairs: 20, cardsColor: .yellow)
    
    static let activitiesTheme = Theme(name: "Activities", emojis: ["🤺", "🏌️", "🏄‍♂️", "🚣", "🏊‍♂️", "🏋️", "🚴‍♂️"], numberOfPairs: -10, cardsColor: .green)
    
    static let fruitsTheme = Theme(name: "Fruits", emojis: ["🍇", "🍉", "🍈", "🍊", "🍋", "🍎", "🍏", "🥭"], numberOfPairs: 5, cardsColor: .purple)
    static let themes = [numbersTheme, emojisTheme, carsTheme, activitiesTheme, fruitsTheme]
    static func createMemoryGame() -> Game {
        
        Game(themes: [numbersTheme, emojisTheme, carsTheme, activitiesTheme, fruitsTheme])
    }
    
    @Published var gameController: Game = createMemoryGame()
    
    func createNewGame() {
        gameController.startNewTheme()
    }
    var cards: [Game.Card] {
        return gameController.cards as! [Game.Card]
    }
    
}
