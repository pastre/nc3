//
//  MissionView.swift
//  NC3
//
//  Created by Bruno Pastre on 21/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    
    var mission: Mission!
    var body: some View {
        ZStack {
            Rectangle()
            .fill(Color("darkBrownColor"))
            
            VStack(alignment: .center) {
                Spacer()
                HStack(alignment: .center){
                    Spacer()
                    ViewWrapper.getText("\(self.mission.getDescription())", size:20).foregroundColor(.white)
                    Spacer()
                    ViewWrapper.getText("300/200", size: 10).foregroundColor(.white)
                    Spacer()
                }
            
            
                HStack {
                    ButtonView(buttonName: "Skip", iconName: "movie", callback: nil, fontSize: 16, isResizeable: true).padding(.all, 10)
                    
                    Spacer()
                    ViewWrapper.getText("+\(self.mission.getDescription())", size: 16).foregroundColor(Color("goldColor"))
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView().previewLayout(.fixed(width: 200, height: 100))
    }
}
