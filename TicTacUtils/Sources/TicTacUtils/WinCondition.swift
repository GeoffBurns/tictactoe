//
//  WinCondition.swift
//  TicTacUtils
//
//  Created by Geoff Burns on 28/6/21.
//
import Foundation

public enum WinCondition
{
    case row (y:Int)
    case col  (x: Int)
    case diag (slant: Slant)
    
    static let rows : [WinCondition] = Array((0...2).map { row(y: $0)})
    static let cols : [WinCondition] = Array((0...2).map { col(x: $0)})
    static let diags : [WinCondition] = [diag(slant: .forward), diag(slant: .back)]
    
    public static let all : [WinCondition] =  rows + cols + diags
    
    public var line : [Int] { get {
        switch self{
        case  .row(y: let y) :
            return [3*y+0,3*y+1,3*y+2]
        case .col(x: let x):
            return [x+0,x+3,x+6]
        case .diag(slant: let slant):
            return slant == .forward ? [0,4,8] : [2,4,6]
        }
    }
    }
    
}
public enum Slant
{
    case forward
    case back
}
