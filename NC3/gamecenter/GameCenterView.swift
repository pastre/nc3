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
    @State var gameVC: GameCenterWrapperViewController?
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            
            if GKLocalPlayer.local.isAuthenticated && self.gameVC == nil {
                Text("Loading").onAppear {
                    print("Displaying GKVC")
                    self.gameVC = self.getGKVC()
                }
            } else if self.gameVC != nil {
                GameCenterAuthWrapper(gameVc: self.gameVC!, isShowing: self.$isShowing)
            } else if self.loginVC != nil {
                GameCenterAuthWrapper(gameVc: self.loginVC!, isShowing: self.$isShowing)
            } else {
                Text("Loading").onAppear {
                    print("Not auth")
                    GKLocalPlayer.local.authenticateHandler = { vc, error in
                        guard error == nil else {
                            print("AE BROW DEU ERRO VIU", error)
                            return
                        }
                        
                        if GKLocalPlayer.local.isAuthenticated {
                            print("Displaying GKVC")
                            self.gameVC = self.getGKVC()
                        } else {
                            print("Displaying loginvc")
                            self.loginVC = vc
                        }
                    }
                    
                }
            }
        }
    }
    
    func getGKVC() -> GameCenterWrapperViewController{

        let gkVC = GKGameCenterViewController()
        let vc = GameCenterWrapperViewController()
        
        gkVC.viewState = .leaderboards
        vc.vc = gkVC
        

        return vc

    }
    
    
}

struct GameCenterAuthWrapper: UIViewControllerRepresentable {
    
    let gameVc: UIViewController!
    @Binding var isShowing: Bool
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<GameCenterAuthWrapper>) -> UIViewController {
        if let vc = self.gameVc as? GameCenterWrapperViewController {
            vc.parentWrapper = self
        }
        return self.gameVc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<GameCenterAuthWrapper>) {
        
    }
    
    func dismiss() {
        self.isShowing = false
    }
    
    typealias UIViewControllerType = UIViewController
    
    
}
