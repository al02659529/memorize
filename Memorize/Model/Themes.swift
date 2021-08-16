//
//  Themes.swift
//  Memorize
//
//  Created by Daniel Alejandro Rosales Lopez on 15/08/21.
//

import Foundation

struct Themes {
    private let themes: [Theme]
    public var currentTheme: Theme?
    
    init(_ themes: [Theme]) {
        self.themes = themes
        self.currentTheme = getNewTheme()
    }
    
    private func getNewTheme() -> Theme {
        let themesIndexes: [Int] = Array(0..<themes.count)
        var visitedIndexes: [Int] = []
        
        while(visitedIndexes.count < themesIndexes.count) {
            let randomIndex = Int.random(in: 0..<themes.count)
            let newTheme = themes[randomIndex]
            if newTheme == currentTheme {
                visitedIndexes.append(randomIndex)
            } else {
                return newTheme
            }
        }
        return themes.randomElement()!
    }
    
    mutating func changeCurrentTheme() -> Theme {
        self.currentTheme = getNewTheme()
        return self.currentTheme!
    }
}
