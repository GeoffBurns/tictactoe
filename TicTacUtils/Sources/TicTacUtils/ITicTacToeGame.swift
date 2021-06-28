//
//  ITicTacToeGame.swift
//  TicTacUtils
//
//  Created by Geoff Burns on 29/6/21.
import SwiftUI

public protocol ITicTacToeGame
{
    var squares : [Owner] { get }
    var isOver : Bool{ get }
}

public extension ITicTacToeGame
{
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
 
    var showWinner : String
    {
        get{
            return  "You " + (winner?.showWinnerAsCross ?? " ")
        }
    }
}
public class TicTacToeGame
{
    public static var startSquares : [Owner]
    {
        get{
            return  Owner.blankSquares( 9)
        }
    } 
}
