//
//  SquareView.swift
//  tictacplus
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI

struct SquareView: View {
    @EnvironmentObject var board: GameBoardVM
    #if os(OSX) || os(macOS) || targetEnvironment(macCatalyst)
    let width : CGFloat =  103
    #else
    let width : CGFloat =  Device.isPhone ? 83 : 153
    #endif
    var index: Int
    var body: some View {
        Button(action: {
            board.play(squareIndex: index)
        }) {
             board.squares[index].image
                .foregroundColor(Color.white)
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
