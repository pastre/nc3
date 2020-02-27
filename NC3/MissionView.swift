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
    var r: CGRect!
    
    @State var isCompleted: Bool = false
    @State var hasAnimated: Bool = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("darkBrownColor"))
            
            VStack(spacing: 0) {
                Spacer()
                HStack(alignment: .center){
                    ViewWrapper.getText("\(mission.getDescription()).", size:20).foregroundColor(.white)
                    AnimatableColorText(from: UIColor.systemFill, to: UIColor.green, pct: self.isCompleted ? 1 : 0) {
                        ViewWrapper.getText("\(self.mission.getProgressDescription())", size: 15)
                    }
                    .scaleEffect(self.isCompleted ? 1.5 : 1)
                    .animation(.easeOut(duration: 1))
                    .scaleEffect(self.isCompleted ? 1/1.5 : 1)
                    .animation(Animation.easeInOut(duration: 0.3).delay(1))
                }
                
                HStack(alignment: .center) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("blueFill"))
                        HStack {
                            Spacer()
                            ViewWrapper.getText("Skip", size: 16).foregroundColor(.white)
                            Spacer()
                            Image("movie").resizable().scaledToFit()
                                .frame(maxWidth: self.r!.size.width * 0.07)
                            
                            Spacer()
                        }
                    }
                    .padding(.leading, 40)
                    .padding(.vertical, 10)
                    
                    ViewWrapper.getText("+\(self.mission.getReward())", size: 16).padding(.trailing, 50).foregroundColor(Color("goldColor"))
                    
                }.gesture(TapGesture().onEnded {
                    print("Mostra o ad ai brow")
                })
                
            }
        }
        .frame(maxWidth: self.r.size.width * 0.95)
        .onAppear {
            if self.mission.isComplete() {
                withAnimation(.easeInOut(duration: 2.0)) {
                    self.isCompleted.toggle()
                }
            }
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView().previewLayout(.fixed(width: 200, height: 100))
    }
}
