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
        HStack(alignment: .center) {
            
            VStack(alignment: .leading) {
                ViewWrapper.getText("Distance", size: 57, weight: .regular)
                    .foregroundColor(Color("blueFill"))
                
                ViewWrapper.getText("3214", size: 83, weight: .heavy)
                    .foregroundColor(Color("blueFill"))
                
                
                Spacer()
                
                ViewWrapper.getText("Coins", size: 57, weight: .regular)
                    .foregroundColor(Color("goldColor"))
                
                ViewWrapper.getText("3214", size: 83, weight: .heavy)
                    .foregroundColor(Color("goldColor"))
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.bottom, 34)
            .padding(.top, 40)
            
            GeometryReader { r in

                VStack(alignment: .center) {
                    
                    HomeButtonView(buttonName: "Home", iconName: "home") {
                        self.goHome()
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    HomeButtonView(buttonName: "Again", iconName: "play") {
                        self.onTryAgain()
                    }
                }.frame(maxWidth: .infinity, maxHeight: r.size.height * 0.3)
                
            }
            
            ZStack {
                GeometryReader { r in
                    
                    RoundedRectangle(cornerRadius: 20)
                    .fill(Color("brownColor"))
                    .padding(.top, 15)
                        .frame(maxWidth: r.size.width * 1)
                    
                
                    VStack {
                        Image("topFloor")
                            .resizable()
                            .frame(maxWidth: r.size.width * 1, maxHeight: r.size.height * 0.1)
                        
                        ViewWrapper.getText("Missions", size: 30)
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("M1")
                    }
                    
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.bottom, 34)
            .padding(.top, 40)
            .padding(.leading, 20)
            .padding(.trailing, 30)
        }
        
    }
    
    func goHome() {
        ObservableGameListener.instance.goHome()
    }
    
    func onTryAgain() {
        GameEventBinder.instance.publish(event: .gameStart)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView().previewLayout(.fixed(width: 896, height: 414))
    }
}
