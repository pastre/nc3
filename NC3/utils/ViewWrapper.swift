//
//  ViewWrapper.swift
//  NC3
//
//  Created by Bruno Pastre on 20/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

class ViewWrapper {
    static func getText(_ text: String, size: CGFloat = 60, weight: Font.Weight = .heavy, _ design: Font.Design = .rounded  ) -> Text {
        return Text(text)
            .font(
                .system(size: size,
                        weight: weight,
                        design: design
                ))
    }
}

extension View {
  func background(with color: Color) -> some View {
    background(GeometryReader { geometry in
      Rectangle().path(in: geometry.frame(in: .local)).foregroundColor(color)
    })
  }
}
