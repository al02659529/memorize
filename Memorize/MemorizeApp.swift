//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Daniel Alejandro Rosales Lopez on 07/08/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(ViewModel: game)
        }
    }
}
