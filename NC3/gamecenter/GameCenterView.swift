//
//  GameCenterView.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SwiftUI
import GameKit

struct GameCenterView: View {
    
    @State var isLoggedIn: Bool = false
    @State var loginVC: UIViewController?
    
    var body: some View {
        ZStack {
            if self.loginVC ==  nil{
                Text("Loading").onAppear {
                    GKLocalPlayer.local.authenticateHandler = { vc, error in
                        guard error == nil else {
                            print("AE BROW DEU ERRO VIU", error)
                            return
                        }
                        
                        self.loginVC = vc
                    }
                }
            } else {
                GameCenterAuthWrapper(gameVc: self.loginVC!)
            }
        }
    }
    
    
}

struct GameCenterAuthWrapper: UIViewControllerRepresentable {
    
    let gameVc: UIViewController!
    func makeUIViewController(context: UIViewControllerRepresentableContext<GameCenterAuthWrapper>) -> UIViewController {
        return self.gameVc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<GameCenterAuthWrapper>) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
    
}
