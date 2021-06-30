//
//  ContentView.swift
//  TicTacPlus
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI

 

struct ContentView: View {
     @EnvironmentObject var board: GameBoardVM
  
      var body: some View {
          VStack {
            Spacer()
            Text("Tic Tac Toe")
                    .foregroundColor(Color.blue)
                    .font(.largeTitle)
             
            BoardView()
            Spacer()
            }
          .ignoresSafeArea(.all, edges: .all)
          .background(Color.white)
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
 
 
