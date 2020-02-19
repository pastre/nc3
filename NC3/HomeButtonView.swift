//
//  HomeButtonView.swift
//  NC3
//
//  Created by Bruno Pastre on 19/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct HomeButtonView: View {
    var body: some View {
        ZStack {
            Rectangle().fill(Color.blue)
            Text("Asdasdasd")
        }
    }
}

struct HomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView().previewLayout(.fixed(width: 568, height: 320))
    }
}
