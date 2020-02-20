//
//  HomeButtonView.swift
//  NC3
//
//  Created by Bruno Pastre on 19/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct HomeButtonView: View {
    
    @State var buttonName: String
    @State var iconName: String
    
    var callback: (() -> ())?
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(Color("darkBlueBorder"))
                .cornerRadius(10)
            
            Rectangle()
                .fill(Color("blueBorder"))
                .cornerRadius(15)
                .padding(5)
            
            Rectangle()
                .fill(Color("blueFill"))
                .cornerRadius(20)
                .padding(10)
        
            HStack {
                Text(self.buttonName)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(Color.white)
                Spacer()
                Image(self.iconName)
            }
            .padding(20)
        }.gesture(TapGesture().onEnded {
            if let callback = self.callback {
                callback()
            }
        })
    }
}

struct HomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView(buttonName: "Debug", iconName: "debug").previewLayout(.fixed(width: 200, height: 100))
    }
}
