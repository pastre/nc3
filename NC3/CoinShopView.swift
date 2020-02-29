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
                            VStack {
                                Spacer()
                                ViewWrapper.getText(self.appstoreListener.products![0].localizedTitle, size: 16).foregroundColor(.white)
//                                Spacer()
                                
                                ViewWrapper.getText(self.appstoreListener.products![0].localizedDescription, size: 16).foregroundColor(Color("goldColor"))
//                                Spacer()
                                ViewWrapper.getText("$\(self.appstoreListener.products![0].price)", size: 16)
                                    .foregroundColor(Color.green)
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
                            VStack {
                                Spacer()
                                ViewWrapper.getText(self.appstoreListener.products![1].localizedTitle, size: 16).foregroundColor(.white)
//                                Spacer()
                                
                                ViewWrapper.getText(self.appstoreListener.products![1].localizedDescription, size: 16).foregroundColor(Color("goldColor"))
//                                Spacer()
                                ViewWrapper.getText("$\(self.appstoreListener.products![1].price)", size: 16)
                                    .foregroundColor(Color.green)
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
                            
                            VStack {
                                Spacer()
                                ViewWrapper.getText(self.appstoreListener.products![2].localizedTitle, size: 16).foregroundColor(.white)
//                                Spacer()
                                
                                ViewWrapper.getText(self.appstoreListener.products![2].localizedDescription, size: 16).foregroundColor(Color("goldColor"))
//                                Spacer()
                                ViewWrapper.getText("$\(self.appstoreListener.products![2].price)", size: 16)
                                    .foregroundColor(Color.green)
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
                            
                            VStack {
                                Spacer()
                                ViewWrapper.getText(self.appstoreListener.products![3].localizedTitle, size: 16).foregroundColor(.white)
//                                Spacer()
                                
                                ViewWrapper.getText(self.appstoreListener.products![3].localizedDescription, size: 16).foregroundColor(Color("goldColor"))
//                                Spacer()
                                ViewWrapper.getText("$\(self.appstoreListener.products![3].price)", size: 16)
                                    .foregroundColor(Color.green)
                                Spacer()
                            }
                        }.offset(x: -10, y: 0)
                    }.offset(x: -10, y: 0)
                }.foregroundColor(.white)
                
                
            }
        }
    }
}
