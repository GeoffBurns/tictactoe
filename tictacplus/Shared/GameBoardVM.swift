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
 
    var humanPlayer = Owner.cross
    var computerPlayer = Owner.naught
    
    func reset() {
          squares = Owner.blankSquares( 9)
     } 
    func hasWon(player: Owner) -> Bool {
        return  squares.hasWon(player: player)
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
    func play(squareIndex:Int) {
        if  squares[squareIndex] != .vacant
        {
            return
        }
        squares[squareIndex] =  humanPlayer
        checkIsOver()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.randomMove(player: self.computerPlayer)
            self.checkIsOver()
            }
    
    }

}
