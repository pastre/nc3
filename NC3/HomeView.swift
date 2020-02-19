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
        
        GeometryReader { r in
            
            VStack {
                HStack(alignment: .top) {
                    
                    HomeButtonView(buttonName: "Shop", iconName: "cart") {
                        print("Cliocou no cart!")
                    }
                    
                    HomeButtonView(buttonName: "Skins", iconName: "peita") {
                        print("Cliocou no skins!")
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    HomeButtonView(buttonName: "\(StorageFacade.instance.getCoins())", iconName: "coinIcon") {
                        print("Cliocou no coins!")
                    }
                    HomeButtonView(buttonName: "Config", iconName: "gear") {
                        print("Cliocou no gear!")
                    }
                        
                    
                    }
                .padding(.top, 10)
                .frame(width: r.size.width, height: r.size.height * 0.05, alignment: .top)
                Spacer()
                
                Button(action: {
                    GameEventBinder.instance.publish(event: .gameStart)
                }) {
                    Text("Tap here to play")
                        .font(.system(size: 60, weight: .heavy, design: .rounded))
                        .foregroundColor(Color("blueFill"))
                }.frame(width: r.size.width, height: r.size.height * 0.05, alignment: .top)
                
                Spacer()
            }.frame(width: r.size.width, height: r.size.height)
        }
    }
    
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView().previewLayout(.fixed(width: 568, height: 320))
    }
}

