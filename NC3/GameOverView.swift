//
//  GameOverView.swift
//  NC3
//
//  Created by Bruno Pastre on 19/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200, alignment: .center)
            
            VStack {
                Spacer()
                Text("Game over!")
                HStack {
                    Text("Try again!")
                    Text("Home")
                }
                Spacer()
            }
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
