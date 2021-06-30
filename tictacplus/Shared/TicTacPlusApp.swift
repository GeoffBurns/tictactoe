//
//  tictacplusApp.swift
//  Shared
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI

@main
struct TicTacPlusApp: App {
    @StateObject var board = GameBoardVM()
    var body: some Scene {
        #if os(OSX) || os(macOS) || targetEnvironment(macCatalyst)
        WindowGroup {
            ContentView()
                .environmentObject(board)
        }
            .windowStyle(HiddenTitleBarWindowStyle())
        #else
        WindowGroup {
            ContentView()
                .environmentObject(board)
        }
        #endif
    }
}
