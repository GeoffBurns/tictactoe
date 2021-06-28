//
//  OwnerExtentions.swift
//  TicTacPlus
//
//  Created by Geoff Burns on 29/6/21.
//

import SwiftUI
import TicTacUtils

extension Owner
{
    public var color: Color
    {
        get {
            switch self
            {
            case .vacant:
                return Color.blue
            case .naught:
                return Color.red
            case .cross:
                return Color.green
            }
        }
    }
}
