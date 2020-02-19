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
                .fill(Color.white)
                .frame(width: 200, height: 200, alignment: .center)
            
            VStack {
                Spacer()
                Text("Game over!")
                HStack {
                    Button(action: {
                        ObservableGameListener.instance.goHome()
                    }) {
                        Text("Home")
                    }
                    Button(action: {
                        
                        GameEventBinder.instance.publish(event: .gameStart)
                    }) {
                        Text("Try again")
                    }
                    
                    
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
