//
//  GameOverView.swift
//  NC3
//
//  Created by Bruno Pastre on 19/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct GameOverView: View, GameEventListener {
    func onGameStart() {
        
    }
    
    func onGameOver() {
        self.currentScore = Player.getWalkingDistance()
        CoinListener.instance.udpateCoinUI()
    }
    
    
    @ObservedObject var missionListener = MissionFacade.instance
    @State var currentScore: Int!
    @State var coinsPosition: CGPoint!
    
    init() {
        GameEventBinder.instance.subscribe(self)
    }
    
    
    var body: some View {
        HStack(alignment: .center) {
            //            GeometryReader { gloabal in
            VStack(alignment: .leading) {
                ViewWrapper.getText("Distance", size: 57, weight: .regular)
                    .foregroundColor(Color("blueFill"))
                
                ViewWrapper.getText("\(String(format: "%04d", Player.getWalkingDistance()))", size: 83, weight: .heavy)
                    .foregroundColor(Color("blueFill"))
                
                Spacer()
                
                ViewWrapper.getText("Coins", size: 57, weight: .regular)
                    .foregroundColor(Color("goldColor"))
                
                
                ViewWrapper.getText("\(String(format: "%04d", self.missionListener.coinReward))", size: 83, weight: .heavy).foregroundColor(Color("goldColor"))
                    .overlay(
                        GeometryReader { rr in
                            Color.clear.onAppear {
                                self.coinsPosition = rr.frame(in: .global).origin
                            }
                            
                        }
                )
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.bottom, 34)
            .padding(.top, 20)
            
            Spacer()
            Spacer()
            
            GeometryReader { r in
                
                VStack(alignment: .center) {
                    
                    Spacer()
                    HomeButtonView(buttonName: "Home", iconName: "home") {
                        self.goHome()
                    }
                    
                    Spacer()
                    
                    HomeButtonView(buttonName: "Again", iconName: "play") {
                        self.onTryAgain()
                    }
                    Spacer()
                }.frame(maxWidth: r.size.width * 0.8, maxHeight: r.size.height * 0.3)
                
            }
            
            Spacer()
            Spacer()
            
            ZStack {
                GeometryReader { r in
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("brownColor"))
                        .padding(.top, 20)
                    
                    VStack(spacing: 0) {
                        Image("topFloor")
                            .resizable()
                            .scaledToFit()
                        Group {
                            ViewWrapper.getText("Missions", size: 30)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                            
                            ForEach(self.missionListener.getMissions()) { mission in
                                
                                VStack{
                                    MissionView(mission: mission, r: r.frame(in: .global), coinsPosition: self.coinsPosition)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 34)
            .padding(.top, 20)
        }.onAppear(perform: self.debugMe)
    }

    func debugMe() {
        print("debug me pls")
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
