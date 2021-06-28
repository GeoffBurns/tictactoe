//
//  GameBoardVM.swift
//  tictacplus
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI
import TicTacUtils
 
class GameBoardVM : ObservableObject, ITicTacToeGame
{
    @Published var squares =  Owner.blankSquares( 9)
    @Published var isOver : Bool = false;
    
    var humanPlayer = Owner.cross
    var computerPlayer = Owner.naught
    
    func reset() {
          squares = Owner.blankSquares( 9)
     }
     
    func checkIsOver()
    {
        if winner != nil
        {
            isOver = true
        }
    }
    func randomMove(player: Owner)    {
        if squares.isFull
        {
            return
        }
        squares[squares.randomFreeIndex] = player
    }
    func bestMove(player: Owner)    {
        if squares.isFull
        {
            return
        }
        squares[squares.bestMoveIndex(player: player)] = player
    }
    func play(squareIndex:Int) {
        if  squares[squareIndex] != .vacant
        {
            return
        }
        squares[squareIndex] =  humanPlayer
        checkIsOver()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.bestMove(player: self.computerPlayer)
            self.checkIsOver()
            }
    } 
}
