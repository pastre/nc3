//
//  GameCenterWrapperViewController.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit
import GameKit

class GameCenterWrapperViewController: UIViewController, GKGameCenterControllerDelegate, UINavigationControllerDelegate {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        self.dismiss(animated: true, completion: nil)
        self.parentWrapper.dismiss()
    }
    
    var vc: GKGameCenterViewController!
    var parentWrapper: GameCenterAuthWrapper!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.vc.delegate = self
        self.vc.gameCenterDelegate = self
        self.present(self.vc, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
