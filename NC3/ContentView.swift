//
//  ContentView.swift
//  NC3
//
//  Created by Bruno Pastre on 17/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            HStack(alignment: .top, spacing: 10, content: {
                VStack(alignment: .leading) {
                    
                    Button(action: {
                        print("Shop")
                    }) {
                        Text("Shop")
                    }
                    
                    Button(action: {
                        print("Characters")
                    }) {
                        Text("Characters")
                    }
                }
                
                
                ZStack(alignment: .center) {
                    GameViewAdapter().edgesIgnoringSafeArea(.all)
                    
                    Button(action: {
                        GameEventBinder.instance.publish(event: .gameStart)
                    }) {
                        Text("ASD")
                    }
                }
            })
            
            
            HStack(alignment: .top){
                Text("asd").frame(alignment: .trailing)
                Text("asd").frame(alignment: .trailing)
                Text("asd").frame(alignment: .trailing)
                Text("asd").frame(alignment: .trailing)

            }.frame(alignment: .trailing)
            
            
        }).frame(alignment: .trailing)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
