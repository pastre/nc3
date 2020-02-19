//
//  ContentView.swift
//  NC3
//
//  Created by Bruno Pastre on 17/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct ContentView: View{
    
    @ObservedObject var gameListener: ObservableGameListener = ObservableGameListener.instance
    
    var body: some View {
        ZStack {
            GameViewAdapter().edgesIgnoringSafeArea(.all)
            if !self.gameListener.isPlaying { HomeView() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
