//
//  CoinShopView.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct CoinShopView: View {
    
    @ObservedObject var appstoreListener = StoreManager.instance
    
    var body: some View {
        VStack {
            if appstoreListener.products != nil {
                self.getLoadedUI()
            } else {
                Text("Loading")
            }
        }
    }
    
    func getLoadedUI() -> some View {
        Group {
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
        }
    }
}
