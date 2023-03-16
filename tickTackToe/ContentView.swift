//
//  ContentView.swift
//  tickTackToe
//
//  Created by Илья Машко on 16.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var clasicTicTacToe: threeByThreeGame
        
    @ViewBuilder func fieldTile(id: Int, content: String) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(.gray)
            Text(content)
                .font(.largeTitle)
        }.onTapGesture {
            clasicTicTacToe.chooseField(id)
        }.padding(1)
    }
    
    var xTurn: Bool {
        clasicTicTacToe.xTurn
    }
    
    var fieldRow: some View {
        
        LazyVGrid(columns: columns){
            ForEach(clasicTicTacToe.fields, id: \.id) { item in
                fieldTile(id: item.id, content: item.state)
            }
        }
        
    }
    
    var columns: [GridItem] {
        var array: [GridItem] = []
        for _ in 0..<Int(sqrt(Double(clasicTicTacToe.fields.count))) {
            array.append(GridItem())
        }
        return array
    }
    
    var body: some View {
        VStack {
            
            if let win = clasicTicTacToe.win {
                if win == ticTacToeGame.winStates.x {
                    Text("X WINS!")
                } else if win == ticTacToeGame.winStates.o {
                    Text("O WINS!")
                } else {
                    Text("It's a DRAW!")
                }
                
                
            } else if xTurn {
                Text("It is X turn")
            } else {
                Text("It is O turn")
            }
            
            Spacer()
            
            fieldRow
            
            Spacer()
            
            Button(action: {
                clasicTicTacToe.newGame()
            }, label: {Text("New game")})
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = threeByThreeGame()
        ContentView(clasicTicTacToe: game)
    }
}
