//
//  GameViewModel.swift
//  Memorize
//
//  Created by Daniel Alejandro Rosales Lopez on 11/08/21.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    static let numbersTheme = Theme(name: "WeirdNumbers", emojis: ["1", "2", "4", "9", "20", "30"], numberOfPairs: 6, cardsColor: .pink)
    
    static let emojisTheme = Theme(name: "Faces", emojis: ["🥰", "😄", "😜", "🥳", "🤓", "😎", "😋", "🤩"], numberOfPairs: 8, cardsColor: .blue)
    
    static let carsTheme = Theme(name: "Cars", emojis: ["🚓", "🏎️", "🚗", "🚎", "🚒", "🚙", "🚑", "🚌"], numberOfPairs: 20, cardsColor: .yellow)
    
    static let activitiesTheme = Theme(name: "Activities", emojis: ["🤺", "🏌️", "🏄‍♂️", "🚣", "🏊‍♂️", "🏋️", "🚴‍♂️"], numberOfPairs: -10, cardsColor: .green)
    
    static let fruitsTheme = Theme(name: "Fruits", emojis: ["🍇", "🍉", "🍈", "🍊", "🍋", "🍎", "🍏", "🥭"], numberOfPairs: 5, cardsColor: .purple)
    
    static var themes = Themes([numbersTheme, emojisTheme, carsTheme, fruitsTheme])
    
    static func createMemoryGame() -> Game {
        Game(theme: themes.currentTheme!)
    }
    
    @Published private var gameController: Game = Game(theme: themes.currentTheme!)
    
    func createNewGame() {
        gameController.theme = GameViewModel.themes.changeCurrentTheme()
        gameController.startTheme()
    }
    
    func choose(_ card: Game.Card) {
        gameController.chooseCard(card)
    }
    
    var cards: [Game.Card] {
        gameController.cards
    }
    
    var title: String {
        return gameController.theme.name
    }
    
    var color: Color {
        return gameController.theme.cardsColor
    }
    
    var score: Int8 {
        return gameController.score
    }
}
