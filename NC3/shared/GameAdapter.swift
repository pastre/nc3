//
//  GameAdapter.swift
//  NC3
//
//  Created by Bruno Pastre on 17/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI

struct GameViewAdapter: UIViewControllerRepresentable {
    static let vc = UIStoryboard(name: "Game", bundle: nil).instantiateInitialViewController() as! GameViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<GameViewAdapter>) -> GameViewController {
        return GameViewAdapter.vc
    }
    
    func updateUIViewController(_ uiViewController: GameViewController, context: UIViewControllerRepresentableContext<GameViewAdapter>) {
        
    }
    
    
}

struct GameViewAdapter_Previews: PreviewProvider {
    static var previews: some View {
        GameViewAdapter()//.previewLayout(.fixed(width: 568, height: 320))
    }
}
