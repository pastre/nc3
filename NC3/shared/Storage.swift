//
//  Stoarge.swift
//  NC3
//
//  Created by Bruno Pastre on 19/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class StorageFacade {
    enum StorageKeys: String {
        case coinAmount = "coinAmount"
        case highScore = "highScore"
        case skinManager = "playerBank" 
    }
    
    var playerBank: PlayerBank!
    var skinManager: SkinManager!
    var highScore:  Int!
    
    static let instance = StorageFacade()
    let defaults = UserDefaults.standard
    
    private init() {
        let coinAmount = defaults.integer(forKey: StorageKeys.coinAmount.rawValue)
        let highScore = defaults.integer(forKey: StorageKeys.highScore.rawValue)
        if let data = defaults.data(forKey: StorageKeys.skinManager.rawValue), let manager = try? JSONDecoder().decode(SkinManager.self, from: data) {
            self.skinManager = manager
        } else {
            self.skinManager = SkinManager()
        }

        self.highScore = highScore
        self.playerBank = PlayerBank(coins: coinAmount)
        
    }
    
    func onCoinsReceived(_ amount: Int) {
        
        self.playerBank.addCoins(amount)
        self.updatePersistance()
    }
    
    func getCoins() -> Int {
        return self.playerBank.coins
    }
    
    func updateHighScore(to value: Int) {
        if value > self.highScore {
            self.defaults.set(value, forKey: StorageKeys.highScore.rawValue)
            GameKitFacade.onHighScore(value)
        }
        GameKitFacade.onHighScore(value)
        self.highScore = self.loadHighscore()
    }
    
    func loadHighscore() -> Int {
        return defaults.integer(forKey: StorageKeys.highScore.rawValue)
    }
    
    func updatePersistance(){
        self.defaults.set(self.playerBank.coins, forKey: StorageKeys.coinAmount.rawValue)
        
        if let data = try? JSONEncoder().encode(self.skinManager) {
            self.defaults.set(data, forKey: StorageKeys.skinManager.rawValue)
        }
    }
}


class PlayerBank {
    var coins: Int!
    
    internal init(coins: Int = 0) {
        self.coins = coins
    }
    
    func addCoins(_ amount: Int) {
        self.coins += amount
    }
}
