//
//  Device.swift
//  TicTacPlus
//
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI

enum Device {
    #if UIDevice
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
  
    #else
    static var isPad: Bool {
        true
    }
    
    static var isPhone: Bool {
        false
    }
    #endif

}
