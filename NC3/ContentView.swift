//
//  ContentView.swift
//  NC3
//
//  Created by Bruno Pastre on 17/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

extension View {
    func fillParent(alignment:Alignment = .center) -> some View {
        return GeometryReader { geometry in
            self
                .frame(width: geometry.size.width,
                       height: geometry.size.height,
                       alignment: alignment)
        }
    }
}

struct ContentView: View {
    var body: some View {
    GameViewAdapter().fillParent(alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
