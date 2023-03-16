//
//  tickTacToeModel.swift
//  tickTackToe
//
//  Created by Илья Машко on 16.03.2023.
//

import Foundation

struct ticTacToeGame {
    
    enum winStates {
        case draw
        case x
        case o
    }
    
    var xTurn = true
    var win : winStates?
    let winRowLength : Int
    let fieldBorderLength : Int
    var fields : [field] = []
    
    struct field {
        let id: Int
        var state = ""
        
        init(_ id: Int) {
            self.id = id
        }
    }
   
    init(winRowLength: Int, fieldBorderLength: Int) {
        self.winRowLength = winRowLength
        self.fieldBorderLength = fieldBorderLength
        
        for index in 0..<fieldBorderLength*fieldBorderLength {
            fields.append(field(index))
        }
        
    }
    
    mutating func tapTheField (_ id: Int) -> Void {
        
        if fields[id].state != "" {
            return
        }
        
        if xTurn {
            fields[id].state = "X"
        } else {
            fields[id].state = "O"
        }
        
        // TODO: check the win state
        
        xTurn.toggle()
    }
    
}
