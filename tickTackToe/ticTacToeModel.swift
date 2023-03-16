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
        
        if fields[id].state != "" || win != nil {
            return
        }
        
        fields[id].state = (xTurn ? "X" : "O")

        // TODO: check the win state
        // Now we are binded to 3x3 field but this should be changed to normal algorythm
        
        let checkFields = fields.filter({$0.state == (xTurn ? "X" : "O") })
        
        winCombos.forEach({ winCombo in
            var winComboFound = true
            winCombo.forEach({ targetId in
                winComboFound = winComboFound && checkFields.contains(where: {$0.id == targetId})
            })
            
            if winComboFound {
                win = (xTurn ? .x : .o)
            }
        })
        
        if !fields.contains(where: {$0.state == ""})  && win == nil {
            win = .draw
        }
        
        // we toggle the turn sign
        xTurn.toggle()
    }
 
    let winCombos: [[Int]] = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
}
