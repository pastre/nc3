//
//  GameOverView.swift
//  NC3
//
//  Created by Bruno Pastre on 19/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct GameOverView: View {
    
    @ObservedObject var missionListener = MissionFacade.instance
    
    
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
                    //                        .frame(maxWidth: r.size.width )
                    
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
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color("darkBrownColor"))
                                    
                                    VStack(spacing: 0) {
                                        Spacer()
                                        HStack(alignment: .center){
                                            ViewWrapper.getText("\(mission.getDescription()).", size:20).foregroundColor(.white)
                                            
                                            ViewWrapper.getText("(300/200)", size: 15).foregroundColor(.white)
                                        }
                                        
                                        HStack(alignment: .center) {
                                            
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color("blueFill"))
                                                HStack {
                                                    Spacer()
                                                    ViewWrapper.getText("Skip", size: 16).foregroundColor(.white)
                                                    Spacer()
                                                    Image("movie").resizable().scaledToFit()
                                                        .frame(maxWidth: r.size.width * 0.07)
                                                        
                                                        
                                                    Spacer()
                                                }
                                            }
                                            .padding(.leading, 40)
                                            .padding(.vertical, 10)
                                        ViewWrapper.getText("+\(mission.getReward())", size: 16)
                                            .padding(.trailing, 50)
                                        .foregroundColor(Color("goldColor"))
                                            
                                        }.gesture(TapGesture().onEnded {
                                            print("Mostra o ad ai brow")
                                        })

                                    }
                                }.frame(maxWidth: r.size.width * 0.95)
                                Spacer()
                                }
                            }
                            
                        }
//                        .offset(x: 0, y: -20)
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
