//
//  GameCenterFacade.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import GameKit

class GameKitFacade {
    enum Leaderboards: String {
        case distance = "distance"
    }
    
    static func onHighScore(_ value: Int ){
        guard GKLocalPlayer.local.isAuthenticated else { return }
        
        
        let score = GKScore(leaderboardIdentifier: Leaderboards.distance.rawValue)
        score.value = Int64(value)
        
        GKScore.report([score]) { (error) in
            if let error = error {
                print("Erro ao reportar o record!", error)
                return
            }
        }
    }
}
