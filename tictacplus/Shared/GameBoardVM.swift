//
//  GameBoardVM.swift
//  tictacplus
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI
import TicTacUtils

class GameBoardVM : ObservableObject
{
    @Published var squares =  Owner.blankSquares( 9)
 
    var currentPlayer = Owner.cross
    var computerPlayer = Owner.naught
    
    func reset() {
          squares = Owner.blankSquares( 9)
     }
     
   
    func hasWon(player: Owner) -> Bool {
        return WinCondition.all.contains { $0.line.allSatisfy { squares[$0] == player }}
    }
    var winner : Owner?
    {
        get {
            if hasWon(player: .cross)
            {
                return .cross
            }
            else if hasWon(player: .naught)
            {
                return .naught
            }
            else if squares.free.isEmpty
            {
            return .vacant
            }
            return nil
        }
    }
     
    @Published var isOver : Bool = false;
    func checkIsOver()
    {
        if winner != nil
        {
            isOver = true
        }
    }
    var showWinner : String
    {
        get{
            return  "You " + (winner?.showWinnerAsCross ?? " ")
        }
    }
    func randomMove(player: Owner)    {
        if squares.isFull
        {
            return
        }
        squares[squares.randomFreeIndex] = player
    }
    func turn(squareIndex:Int) {
        if  squares[squareIndex] != .vacant
        {
            return
        }
        squares[squareIndex] =  currentPlayer
        checkIsOver()
        randomMove(player: computerPlayer)
        checkIsOver()
    }

}
