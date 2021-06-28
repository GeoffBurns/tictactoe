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
        WindowGroup {
            ContentView()
                .environmentObject(board)
        }
    }
}
