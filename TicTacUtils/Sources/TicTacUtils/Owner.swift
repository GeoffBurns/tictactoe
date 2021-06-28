//
//  Owner.swift
//  TicTacUtils
//
//  Created by Geoff Burns on 28/6/21.
//

import Foundation

public enum Owner
{
    case vacant
    case naught
    case cross
    
    public var show: String
    {
        get {
            switch self
            {
            case .vacant:
                return " "
            case .naught:
                return "0"
            case .cross:
                return "X"
            }
        }
    }
    public var opponent: Owner
    {
        get {
            switch self
            {
            case .vacant:
                return .vacant
            case .naught:
                return .cross
            case .cross:
                return .naught
            }
        }
    }
    public var showWinnerAsCross : String
    {
        switch self
        {
        case .vacant:
            return "Draw!"
        case .naught:
            return "Lose!"
        case .cross:
            return "Win!"
        }
    }
    public var showWinnerAsNaught : String
    {
        switch self
        {
        case .vacant:
            return "Draw!"
        case .cross:
            return "Lose!"
        case .naught:
            return "Win!"
        }
    }
    public static func blankSquares(_ n: Int) -> [Owner]
    {
       return [Owner](repeating: .vacant, count: n)
    }
     
}
extension Array where Element == Owner
{
    public var free:  [Int]  { get
      {
      self
          .enumerated()
          .filter { $0.element == .vacant }
          .map { $0.offset }
      }
   }
  public var randomFreeIndex:   Int   { get
      {
       let moves =  self.free
       
       let move = Int.random(in: 0..<moves.count)
       return moves[move]
      }
   }
   public var isFull:   Bool   {
       get
      {
           return self.free.isEmpty
      }
   }
    public func hasWon(player: Owner) -> Bool {
        return WinCondition.all.contains { $0.line.allSatisfy { self[$0] == player }}
    }
    public func complete(player: Owner) -> Int? {
        for condition in WinCondition.all
        {
            let line = condition.line
            if line.filter({ self[$0] == player }).count == 2
            {
                let emptySquares = line.filter{ self[$0] == .vacant }
                if emptySquares.count == 1
                {
                    return emptySquares[0]
                }
            }
        }
        return nil
    }
    public func winSquaresFor(player: Owner) -> [Owner]? {
        for condition in WinCondition.all
        {
            let line = condition.line
            if line.allSatisfy({ self[$0] == player })
            {
                var winSquares = TicTacToeGame.startSquares
                for index in line
                {
                    winSquares[index] = player
                }
                return winSquares
            }
        }
        return nil
    }
    public var winSquares: [Owner] {
        get
       {
            if let crossWin = winSquaresFor(player: .cross)
            {
                return crossWin
            }
            if let naughtWin = winSquaresFor(player: .naught)
            {
                return naughtWin
            }
            return TicTacToeGame.startSquares
       }
    }
    public func bestMoveIndex(player: Owner) -> Int {
       if let winMoveIndex = complete(player: player)
       {
        return winMoveIndex
       }
        if let stopLossIndex = complete(player: player.opponent)
        {
         return stopLossIndex
        }
        return self.randomFreeIndex
    }
}
