//
//  HomeView.swift
//  NC3
//
//  Created by Bruno Pastre on 18/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @State var isCoinShop: Bool = true
    @State var aBadernaEstaLiberada = false
    
    
    var body: some View {
        
        GeometryReader { r in
            
            VStack(spacing: 0) {
                HStack {
                    self.getCoinCount(r.size).padding(.leading, 20)
                    Spacer()
                    HStack(alignment: .top, spacing: 40) {
                        
                        HStack(spacing: 20) {

                            Spacer()
                            
                            Button(action: {
                                self.aBadernaEstaLiberada.toggle()
                            }) {
                                GeometryReader {zReader in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(Color("blueFill"))
                                            .offset(x:0, y: -20)
                                        Image("crown")
                                            .resizable()
                                        .scaledToFit()
                                            .frame(width: zReader.size.width * 0.8)
                                            .foregroundColor(.white)
                                        
                                    }.frame(width: r.size.width * 0.1)
                                }
                            }
                            
                            Button(action: {
                                
                            }) {
                                GeometryReader {zReader in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(Color("blueFill"))
                                            .offset(x:0, y: -20)
                                        Image("gear")
                                            .resizable()
                                        .scaledToFit()
                                            .frame(width: zReader.size.width * 0.75)
                                            .foregroundColor(.white)
                                        
                                    }.frame(width: r.size.width * 0.1)
                                }
                            }
                            

                            
                        }
                        
                        Spacer()
                    }
                    .padding(.top, -20)
                    
                    .frame(width: r.size.width * 0.3)
                }
                
                HStack {
                    
                    GeometryReader { rr in
                        self.getShop(rr.size, r.size)
                    }
                    Button(action: {
                        GameEventBinder.instance.publish(event: .gameStart)
                    }) {
                        Text("Tap to play")
                            .font(.system(size: 60, weight: .heavy, design: .rounded))
                            .foregroundColor(Color("blueFill"))
                    }.frame(width: r.size.width * 0.6)
                    
                }
                .frame(height: r.size.height * 0.75)
                
                
            }
            .sheet(isPresented: self.$aBadernaEstaLiberada) {
                GameCenterView(isShowing: self.$aBadernaEstaLiberada)
            }
            .edgesIgnoringSafeArea(.all)
            
            
        
            
        }
    }
    
    func getCoinCount(_ globalSize: CGSize) -> some View {
        HStack {
            
            Image("gold1")
                .resizable()
                .scaledToFit()
                
                .frame(width: globalSize.width * 0.05, height: globalSize.height * 0.08)
            
            ViewWrapper.getText(String(format:"%04d", StorageFacade.instance.getCoins()))
                .foregroundColor(Color("goldColor"))
            
        }
    }
    
    func getShop(_ size: CGSize, _ globalSize: CGSize) -> some View {
        ZStack {
            Rectangle().foregroundColor(Color(red: 145/255, green: 112/255, blue: 82/255))
            
            VStack
                {
                    Image("topRoof").resizable().frame(width: size.width, height: size.height * 0.2).padding(.bottom, -80)
                    ViewWrapper.getText("Shop").foregroundColor(.white)
                    Spacer()
                    
                    CoinShopView()
                    
                    Divider()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            if !self.isCoinShop {
                                self.isCoinShop.toggle()
                            }
                        }) {
                            VStack(spacing: 1) {
                                self.getCoinImage()
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: globalSize.height * 0.08)
                                
                                Text("Coins").foregroundColor(self.isCoinShop ? Color("goldColor") : .gray)
                                
                            }
                        }.foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            if self.isCoinShop {
                                self.isCoinShop.toggle()
                            }
                        }) {
                            VStack(spacing: 1)  {
                                self.getSkinImage()
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: globalSize.height * 0.08)
                                Text("Skins").foregroundColor(!self.isCoinShop ? Color(red: 141/255, green: 181/255, blue: 231/255) : .gray)
                            }
                        }.foregroundColor(.white)
                        
                        Spacer()
                    }.padding(.bottom, 40)
                    
                    
            }
        }
    }
    
    func getCoinImage() -> Image {
        return self.isCoinShop ? Image("gold1") : Image("coinIcon")
    }
    
    func getSkinImage() -> Image {
        return self.isCoinShop ? Image("deselectedSkin") : Image("selectedSkin")
    }
    
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView().previewLayout(.fixed(width: 1792 / 2
            , height: 828 / 2))
    }
}

