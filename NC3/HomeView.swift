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
    
    var body: some View {
        
        GeometryReader { r in
            HStack(alignment: .center) {
            
                VStack(alignment: .leading) {
                    
                    HStack {
                        
                        Image("gold1")
                            .resizable()
                            .scaledToFit()
                            
                            .frame(width: r.size.width * 0.05, height: r.size.height * 0.08)
                        
                        ViewWrapper.getText(String(format:"%04d", StorageFacade.instance.getCoins()))
                            .foregroundColor(Color("goldColor"))
                        
                    }.padding([.top, .leading], 20)

                    GeometryReader { readerzinho in
                    ZStack {
                        Rectangle().foregroundColor(Color(red: 145/255, green: 112/255, blue: 82/255))
                       
                            VStack
                            {
                                Image("topRoof").resizable().frame(width: readerzinho.size.width, height: readerzinho.size.height * 0.2).padding(.bottom, -80)
                            ViewWrapper.getText("Shop").foregroundColor(.white)
                            Spacer()
                            HStack(spacing: 20) {
                                Button(action: {}) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color(red: 122/255, green: 96/255, blue: 69/255)).padding(.leading)
                                        HStack {
                                            Image("yellowAlien")
                                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                                .resizable()
                                                .scaledToFit()
//                                                .padding()
                                                
                                                
                                            VStack {
                                                Spacer()
                                                ViewWrapper.getText("asd", size: 16).foregroundColor(.white)
                                                Spacer()
                                                ViewWrapper.getText("10000", size: 16)
                                                .foregroundColor(Color("goldColor"))
                                                Spacer()
                                            }
                                        }
                                    }
                                }.foregroundColor(.white)
                                
                                Button(action: {}) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color(red: 122/255, green: 96/255, blue: 69/255))
                                        HStack {
                                            
                                            Image("pinkAlien")
                                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                                .resizable()
                                                .scaledToFit()
//                                                .padding()
                                                
                                                
                                            VStack {
                                                Spacer()
                                                ViewWrapper.getText("Buy me", size: 16).foregroundColor(.white)
                                                Spacer()
                                                ViewWrapper.getText("10000", size: 16)
                                                .foregroundColor(Color("goldColor"))
                                                Spacer()
                                            }
                                        }.offset(x: -10, y: 0)
                                    }.offset(x: -10, y: 0)
                                }.foregroundColor(.white)
                                
                                
                            }
                            HStack(spacing: 20) {
                                Button(action: {}) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color(red: 122/255, green: 96/255, blue: 69/255)).padding(.leading)
                                        HStack {
                                            Image("greenAlien")
                                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                                .resizable()
                                                .scaledToFit()
//                                                .padding()
                                                
                                                
                                            VStack {
                                                Spacer()
                                                ViewWrapper.getText("asd", size: 16).foregroundColor(.white)
                                                Spacer()
                                                ViewWrapper.getText("10000", size: 16)
                                                .foregroundColor(Color("goldColor"))
                                                Spacer()
                                            }
                                        }
                                    }
                                }.foregroundColor(.white)
                                
                                Button(action: {}) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color(red: 122/255, green: 96/255, blue: 69/255))
                                        HStack {
                                            Image("brownAlien")
                                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                                .resizable()
                                                .scaledToFit()
//                                                .padding()
                                                
                                                
                                            VStack {
                                                Spacer()
                                                ViewWrapper.getText("Buy me", size: 16).foregroundColor(.white)
                                                Spacer()
                                                ViewWrapper.getText("10000", size: 16)
                                                .foregroundColor(Color("goldColor"))
                                                Spacer()
                                            }
                                        }.offset(x: -10, y: 0)
                                    }.offset(x: -10, y: 0)
                                }.foregroundColor(.white)
                                
                                
                            }

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
                                            .frame(height: r.size.height * 0.08)
                                        
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
                                            .frame(height: r.size.height * 0.08)
                                        Text("Skins").foregroundColor(!self.isCoinShop ? Color(red: 141/255, green: 181/255, blue: 231/255) : .gray)
                                    }
                                }.foregroundColor(.white)
                                
                                Spacer()
                            }.padding(.bottom, 40)
                            
                        }
                        }
                    }
                }
                .frame(width: r.size.width * 0.35)
                Spacer()
                Button(action: {
                    GameEventBinder.instance.publish(event: .gameStart)
                }) {
                    Text("Tap here to play")
                        .font(.system(size: 60, weight: .heavy, design: .rounded))
                        .foregroundColor(Color("blueFill"))
                }


                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("AAA")
                        }
                        
                        Button(action: {}) {
                            Text("aaaaa")
                        }
                    }.padding()
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.all)
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

