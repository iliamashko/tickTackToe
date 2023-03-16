//
//  tickTackToeApp.swift
//  tickTackToe
//
//  Created by Илья Машко on 16.03.2023.
//

import SwiftUI

@main
struct ticTacToeApp: App {
    
    
    
    var body: some Scene {
        WindowGroup {
            let game = threeByThreeGame()
            ContentView(clasicTicTacToe: game)
        }
    }
}
