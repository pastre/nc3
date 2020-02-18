//
//  File.swift
//  NC3
//
//  Created by Bruno Pastre on 18/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

protocol GameEventListener {
    func onGameStart()
    func onGameOver()
}


class GameEventBinder: GameEventListener {
    
    private var supplicants = [GameEventListener]()
    
    static let instance = GameEventBinder()
    private init (){}
    
    enum Event: String {
        case gameStart = "gameStart"
        case gameOver = "gameOver"

        func asNotificationName() -> NSNotification.Name {
          return NSNotification.Name.init(rawValue: self.rawValue)
        }
    }
    
    func subscribe(_ who: GameEventListener) {
        self.supplicants.append(who)
    }
    
    func publish(event: Event) {
        switch event {
        case .gameOver:
            self.onGameOver()
        case .gameStart:
            self.onGameStart()
        }
    }
    
    func onGameOver() {
        self.supplicants.forEach {
            $0.onGameOver()
        }
    }
    
    func onGameStart() {
        self.supplicants.forEach {
            $0.onGameStart()
        }
    }
    
    
}
