//
//  MissionView.swift
//  NC3
//
//  Created by Bruno Pastre on 21/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    
    var mission: Mission!
    var r: CGRect!
    var coinsPosition: CGPoint!
    
    @State var isCompleted: Bool = false
    @State var hasAnimated: Bool = false
    @State var isReadyToSwap: Bool = false
    @State var hasSwapped: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("darkBrownColor"))
                .offset(x: self.isReadyToSwap ? 300 : 1, y: 0)
                .animation(.linear(duration: 0.5))
                .clipped()
            
            VStack(spacing: 0) {
                Spacer()
                
                HStack(alignment: .center){
                    ViewWrapper.getText("\(mission.getDescription()).", size:20).foregroundColor(.white)
                    AnimatableColorText(from: UIColor(red: 1, green: 1, blue: 1, alpha: 1), to: UIColor.green, pct: self.isCompleted ? 1 : 0) {
                        ViewWrapper.getText("\(self.mission.getProgressDescription())", size: 15)
                    }
                
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
                                .frame(maxWidth: self.r!.size.width * 0.07)
                            
                            Spacer()
                        }
                    }
                        
                    .padding(.leading, 40)
                    .padding(.vertical, 10)
                    
                    GeometryReader { reader in
                        return ViewWrapper.getText("+\(self.mission.getReward())", size: 16)
                                .padding(.trailing, 50)
                                .foregroundColor(Color("goldColor"))
                        
                    }
                }.gesture(TapGesture().onEnded {
                    print("Mostra o ad ai brow")
                })
            }
            .offset(x: self.hasSwapped ? 0 : -300, y: 0)
            .opacity(self.hasSwapped ? 1 : 0)
        .clipped()
            .animation(.easeOut(duration: 1))
            
            VStack(spacing: 0) {
                Spacer()
                
                HStack(alignment: .center){
                    ViewWrapper.getText("\(mission.getDescription()).", size:20).foregroundColor(.white)
                    AnimatableColorText(from: UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), to: UIColor.green, pct: self.isCompleted ? 1 : 0) {
                        ViewWrapper.getText("\(self.mission.getProgressDescription())", size: 15)
                    }
                
                    .scaleEffect(self.isCompleted ? 1.5 : 1)
                    .animation(.easeOut(duration: 1))
                }
                .offset(x: self.isReadyToSwap ? 300 : 1, y: 0)
                .animation(.linear(duration: 0.5))
                .clipped()
                
                HStack(alignment: .center) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("blueFill"))
                        HStack {
                            Spacer()
                            ViewWrapper.getText("Skip", size: 16).foregroundColor(.white)
                            Spacer()
                            Image("movie").resizable().scaledToFit()
                                .frame(maxWidth: self.r!.size.width * 0.07)
                            
                            Spacer()
                        }
                    }
                    .offset(x: self.isReadyToSwap ? 300 : 1, y: 0)
                    .animation(.linear(duration: 0.5))
                    .padding(.leading, 40)
                    .padding(.vertical, 10)
                    
                    GeometryReader { reader in
                        return ViewWrapper.getText(self.hasSwapped ? "" : "+\(self.mission.getReward())", size: 16)
                                .padding(.trailing, 50)
                                .foregroundColor(Color("goldColor"))
                                .offset(x: self.hasAnimated ?  -reader.frame(in: .global).origin.x + self.coinsPosition.x : 0, y: self.hasAnimated ?  -reader.frame(in: .global).origin.y + self.coinsPosition.y : 0)
                                .animation(.easeInOut(duration: 2)
                        )
                    }
                }.gesture(TapGesture().onEnded {
                    print("Mostra o ad ai brow")
                })
            }
        }
        .frame(maxWidth: self.r.size.width * 0.95)
        .onAppear {
            if self.mission.isComplete() {
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.isCompleted.toggle()
                }
                
                withAnimation(.easeOut(duration: 1)) {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                        self.hasAnimated.toggle()
                        self.isReadyToSwap.toggle()
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
//                            StorageFacade.instance.onCoinsReceived(self.mission.getReward())
                            Player.receiveMissionCoins(self.mission.getReward())
                            MissionFacade.instance.refreshMissions()
                            self.hasSwapped.toggle()
                        }
                    }
                }
            }
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView().previewLayout(.fixed(width: 200, height: 100))
    }
}

