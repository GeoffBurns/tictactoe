//
//  BoardView.swift
//  TicTacPlus
//
//  Created by 🦋 Aurelie 🦋 on 30/6/21.
//

import SwiftUI

struct BoardView: View {  
    var body: some View {
        HStack {
            Spacer()
            SquareView(index:0)
            SquareView(index:1)
            SquareView(index:2)
            Spacer()
        }
        HStack {
                Spacer()
                SquareView(index:3)
                SquareView(index:4)
                SquareView(index:5)
                Spacer()
        }
        HStack {
                Spacer()
                SquareView(index:6)
                SquareView(index:7)
                SquareView(index:8)
                Spacer()
        } 
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
