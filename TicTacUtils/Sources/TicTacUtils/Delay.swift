//
//  delay.swift
//  TicTacUtils
//
//  Created by Geoff Burns on 29/6/21.
//
 
import Foundation
 
public enum Delay
{
    public static func seconds(_ delay:Double, callback:@escaping @convention(block) () -> Void)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay ,execute: callback)
    }
}

