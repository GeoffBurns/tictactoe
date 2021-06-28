//
//  SquareView.swift
//  tictacplus
//
//  Created by Geoff Burns on 28/6/21.
//

import SwiftUI

struct SquareView: View {
    @EnvironmentObject var board: GameBoardVM
    var index: Int
    var body: some View {
        Button(action: {
            board.play(squareIndex: index)
        }) {
            Text( board.squares[index].show)
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .frame(minWidth: 80, minHeight: 80)
                .background(Color.blue)
                .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
        }
    }
}
