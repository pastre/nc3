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
        
        VStack(alignment: .center) {
            GeometryReader { r in
                HStack(alignment: .top) {
                    HStack(alignment: .top) {
                        HomeButtonView(buttonName: "Shop", iconName: "cart") {
                            print("Cliocou no cart!")
                        }
                        
                        HomeButtonView(buttonName: "Skins", iconName: "peita") {
                            print("Cliocou no skins!")
                        }
                        
                    }.frame(alignment: .leading)
                    
                    Spacer()
                    
                    HStack(alignment: .top) {
                        HomeButtonView(buttonName: "321", iconName: "coinIcon") {
                            print("Cliocou no coins!")
                        }
                        HomeButtonView(buttonName: "Config", iconName: "gear") {
                            print("Cliocou no gear!")
                        }
                        
                    }
                    
                }.frame(width: r.size.width, height: r.size.height * 0.05, alignment: .top)
                Spacer()
                
            }.padding(.top, 10)
            
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

