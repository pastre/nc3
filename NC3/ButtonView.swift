//
//  ButtonView.swift
//  NC3
//
//  Created by Bruno Pastre on 21/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    @State var buttonName: String
    @State var iconName: String
    
    
    var callback: (() -> ())?
    var fontSize: CGFloat = 30
    var isResizeable: Bool! = false
    var cornerRadius: CGFloat = 20
    var body: some View {
        ZStack {
            Rectangle()
                    .fill(Color("blueFill"))
                .cornerRadius(self.cornerRadius)
//                    .padding(10)
            
                HStack {
                    Text(self.buttonName)
                        .font(.system(size: self.fontSize, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                    Spacer()
                    if self.isResizeable {
                        Image(self.iconName).resizable().scaledToFit()
                    } else {
                        Image(self.iconName)
                    }
                }
                .padding(20)
        }.gesture(TapGesture().onEnded {
            if let callback = self.callback {
                callback()
            }
        })
    }
    
    
}



struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonName: "Debug", iconName: "debug").previewLayout(.fixed(width: 200, height: 100))
    }
}
