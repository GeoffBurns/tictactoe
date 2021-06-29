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
    @Published var squares =  TicTacToeGame.startSquares
    @Published var winSquares =  TicTacToeGame.startSquares
    @Published var isOver : Bool = false;
    
    var humanPlayer = Owner.cross
    var computerPlayer = Owner.naught
    
    func reset() {
        squares = TicTacToeGame.startSquares
        winSquares = TicTacToeGame.startSquares
     }
     
    func checkIsOver()
    {
        if winner != nil
        {
            winSquares = squares.winSquares
            
            Delay.seconds(0.5) {
                self.isOver = true
            }
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
    func humanMove(squareIndex:Int)    {
        if  squares[squareIndex] != .vacant
        {
            return
        }
        squares[squareIndex] =  humanPlayer
    }
    func play(squareIndex:Int) {
        humanMove(squareIndex: squareIndex)
        checkIsOver()
        Delay.seconds(0.4) {
            self.bestMove(player: self.computerPlayer)
            self.checkIsOver()
            }
    }
}
