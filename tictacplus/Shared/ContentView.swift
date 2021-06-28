//
//  ContentView.swift
//  Shared
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI

struct ContentView: View {
     @EnvironmentObject var board: GameBoardVM
  
      var body: some View {
          VStack {
            HStack {
              SquareView(index:0)
              SquareView(index:1)
              SquareView(index:2)
            }
            HStack {
              SquareView(index:3)
              SquareView(index:4)
              SquareView(index:5)
            }
            HStack {
              SquareView(index:6)
              SquareView(index:7)
              SquareView(index:8)
            }
            }
          .alert(isPresented: $board.isOver) {
                  Alert(title: Text( board.showWinner) ,  dismissButton: Alert.Button.destructive(Text("Try Again"), action:
                              board.reset
                           ) )
          }
      }
}
struct ContentView_Previews: PreviewProvider {
    static let board = GameBoardVM()
    static var previews: some View {
        ContentView()
          .environmentObject(board)
  
    }
}
 
 
