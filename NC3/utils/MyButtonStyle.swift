//
//  ButtonStyle.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct MenuButtonStyle:  ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 20)
            configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color("blueFill"))
                .padding(.vertical, 10)
            .cornerRadius(40)
            .foregroundColor(.white)
//            .padding(.horizontal, 20)
//        }
    }
    
}


struct MenuButtonStyle_Preview: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            HStack {
                Text("Debug")
                Image("debug")
            }
        }.buttonStyle(MenuButtonStyle())
            .previewLayout(.fixed(width: 568 * 2, height: 320 * 2))
    }
}
