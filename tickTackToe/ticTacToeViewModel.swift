//
//  ticTacToeViewModel.swift
//  tickTackToe
//
//  Created by Илья Машко on 16.03.2023.
//

import SwiftUI

class threeByThreeGame: ObservableObject {
    
    @Published private(set) var ticTackToeModel = ticTacToeGame(winRowLength: 3, fieldBorderLength: 3)
    
    var xTurn: Bool {
        ticTackToeModel.xTurn
    }
    var win: ticTacToeGame.winStates? {
        ticTackToeModel.win
    }
    var fields: [ticTacToeGame.field] {
        ticTackToeModel.fields
    }
    
    func chooseField(_ id: Int) {
        ticTackToeModel.tapTheField(id)
    }
    
    func newGame() {
        ticTackToeModel = ticTacToeGame(winRowLength: 3, fieldBorderLength: 3)
    }
    
}




















