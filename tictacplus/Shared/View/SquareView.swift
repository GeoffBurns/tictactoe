//
//  SquareView.swift
//  tictacplus
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI

struct SquareView: View {
    @EnvironmentObject var board: GameBoardVM
    #if targetEnvironment(macCatalyst)
    let width : CGFloat =  .infinity
    #else
    let width : CGFloat =  Device.isPhone ? 83 : 123
    #endif
    var index: Int
    var body: some View {
        Button(action: {
            board.play(squareIndex: index)
        }) {
            Text( board.squares[index].show)
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .frame(minWidth:  width, minHeight: width)
        } 
        .background(board.winSquares[index].color)
        .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
    }
}

struct SquareView_Previews: PreviewProvider {
    static let board = GameBoardVM()
    static var previews: some View {
        SquareView(index: 0)
          .environmentObject(board)
  
    }
}
