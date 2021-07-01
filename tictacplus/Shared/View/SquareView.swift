//
//  SquareView.swift
//  tictacplus
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI

struct SquareView: View {
    @EnvironmentObject var board: GameBoardVM
 
    let width : CGFloat =  Device.isPhone ? 83 : 153
    var index: Int
    var body: some View {
    #if os(OSX) || os(macOS) || targetEnvironment(macCatalyst)
        Button(action: {
            board.play(squareIndex: index)
        }) {
             Text(board.squares[index].show)
                .font(.system(size: 95, weight: .bold, design: .default))
                .foregroundColor(Color.white)
                .frame(minWidth:  103, minHeight: 103)
        }
        .buttonStyle(PlainButtonStyle())
        .background(board.winSquares[index].color)
        .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
    #else
        Button(action: {
            board.play(squareIndex: index)
        }) {
             board.squares[index].image
                .foregroundColor(Color.white)
                .frame(minWidth:  width, minHeight: width)
        }
        .background(board.winSquares[index].color)
        .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
    #endif
    }
}

struct SquareView_Previews: PreviewProvider {
    static let board = GameBoardVM()
    static var previews: some View {
        SquareView(index: 0)
          .environmentObject(board)
  
    }
}
