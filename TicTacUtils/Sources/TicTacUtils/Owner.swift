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
}
