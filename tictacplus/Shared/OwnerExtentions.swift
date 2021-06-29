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
    public var imageName :String
    {
        switch self
        {
            
        case .cross : return "xmark" // "staroflife.fill"
        case .naught : return "circle"  // "smiley"
        case .vacant : return " "
        }
    }
    @ViewBuilder
    public var image : some View {
        if self == .vacant
            {
                Text(" ")
            }
        else
            {
                Image(systemName: self.imageName).font(Font.system(size: Owner.fontsize, weight: .black))
            }
     }
    public static let smallfont : CGFloat = 30
    public static let bigfont : CGFloat = 60
    public static var fontsize : CGFloat {get{ Device.isPad ? bigfont : smallfont}}
}
 
