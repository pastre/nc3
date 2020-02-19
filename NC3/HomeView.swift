//
//  HomeView.swift
//  NC3
//
//  Created by Bruno Pastre on 18/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                HStack(alignment: .top) {
                    Text("Shop")
                    Text("Skins")
                }.frame(alignment: .leading)
                
                Spacer()
                
                Spacer()
                HStack(alignment: .top) {
                    Text("Shop")
                    Text("compra ai cuseta")
                }
                
            }
            
            Spacer()
            Button(action: {
                GameEventBinder.instance.publish(event: .gameStart)
            }) {
                Text("Tap here to play")
            }
            Spacer()
        }
    }
    
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView().previewLayout(.fixed(width: 568, height: 320))
    }
}

