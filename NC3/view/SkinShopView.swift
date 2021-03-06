//
//  SkinShopView.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct SkinShopView: View {
    
    var body: some View {
        Group {
            HStack(spacing: 20) {
                Button(action: {
                    self.onSkinSelected("Canvy")
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color(red: 122/255, green: 96/255, blue: 69/255)).padding(.leading)
                        HStack {
                            Image("yellowAlien")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .scaledToFit()

                            AlienDescription(alienName: "Canvy")
                            
                        }
                    }
                }.foregroundColor(.white)
                
                Button(action: {
                    
                    self.onSkinSelected("Bloxy")
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color(red: 122/255, green: 96/255, blue: 69/255))
                        HStack {
                            
                            Image("pinkAlien")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .scaledToFit()
                            
                                AlienDescription(alienName: "Bloxy")
                        }.offset(x: -10, y: 0)
                    }.offset(x: -10, y: 0)
                }.foregroundColor(.white)
                
                
            }
            HStack(spacing: 20) {
                Button(action: {
                    
                    self.onSkinSelected("Jumpzy")
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color(red: 122/255, green: 96/255, blue: 69/255)).padding(.leading)
                        HStack {
                            Image("greenAlien")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .scaledToFit()
                            //                                                .padding()
                            

                            AlienDescription(alienName: "Jumpzy")
                            
                        }
                    }
                }.foregroundColor(.white)
                
                Button(action: {
                    
                    self.onSkinSelected("Dotty")
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color(red: 122/255, green: 96/255, blue: 69/255))
                        HStack {
                            Image("brownAlien")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .scaledToFit()
                            //                                                .padding()
                            
                            
                            AlienDescription(alienName: "Dotty")
                            
                        }.offset(x: -10, y: 0)
                    }.offset(x: -10, y: 0)
                }.foregroundColor(.white)
                
                
            }
        }
    }
    
    struct AlienDescription: View {
        var alienName: String
        
        @ObservedObject var storage = StorageFacade.instance
        
        var body: some View {

            VStack {
                Spacer()
                ViewWrapper.getText(self.alienName, size: 16).foregroundColor(.white)
                Spacer()
                
                if self.storage.isUnlocked(self.alienName) {
                    if self.storage.isSkinSelected(self.alienName) {
                        ViewWrapper.getText("Unequip", size: 16)
                            .foregroundColor(Color.red)
                    }  else {
                        ViewWrapper.getText("Equip", size: 16)
                            .foregroundColor(Color.green)
                    }
                } else {

                    ViewWrapper.getText("10.000", size: 16)
                        .foregroundColor(Color("goldColor"))
                }
                Spacer()
            }

        }
    }
    
    func onSkinSelected(_ named: String) {
        if !StorageFacade.instance.isUnlocked(named) {
            StorageFacade.instance.unlock(skin: named)
        } else if  StorageFacade.instance.isSkinSelected(named) {
            StorageFacade.instance.deselect(skin: named)
        } else {
            StorageFacade.instance.select(skin: named)
        }
        
    }
}
