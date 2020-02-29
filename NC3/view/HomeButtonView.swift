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
                .cornerRadius(8)
            
            Rectangle()
                .fill(Color("blueBorder"))
                .cornerRadius(8)
                .padding(4)
            ButtonView(buttonName: self.buttonName, iconName: self.iconName, callback: self.callback, cornerRadius: 8).edgesIgnoringSafeArea(.all).padding(8)
        }
    }
}

struct HomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView(buttonName: "Debug", iconName: "debug").previewLayout(.fixed(width: 200, height: 100))
    }
}
