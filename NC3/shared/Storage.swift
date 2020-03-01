//
//  Stoarge.swift
//  NC3
//
//  Created by Bruno Pastre on 19/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation


class StorageFacade: ObservableObject {
    enum StorageKeys: String {
        case coinAmount = "coinAmount"
        case highScore = "highScore"
        case skinManager = "playerBank"
        case accumulatedCoins = "accumulatedCoins"
    }
    
    var accumulatedCoins: Int!
    var coins: Int!
    var skinManager: SkinManager!
    var highScore: Int!
    
    static let instance = StorageFacade()
    let defaults = UserDefaults.standard
    
    private init() {
        let coinAmount = defaults.integer(forKey: StorageKeys.coinAmount.rawValue)
        let accCoinAmount = defaults.integer(forKey: StorageKeys.accumulatedCoins.rawValue)
        let highScore = defaults.integer(forKey: StorageKeys.highScore.rawValue)
        
        if let data = defaults.data(forKey: StorageKeys.skinManager.rawValue), let manager = try? JSONDecoder().decode(SkinManager.self, from: data) {
            self.skinManager = manager
        } else {
            self.skinManager = SkinManager()
        }

        self.highScore = highScore
        self.coins = coinAmount
        self.accumulatedCoins = accCoinAmount
        
    }
    
    func onCoinsReceived(_ amount: Int, _ isBought: Bool = false) {
        
        self.coins += amount
        
        if !isBought {

            self.accumulatedCoins += amount
            GameKitFacade.onNewAccumulatedCoins(self.accumulatedCoins)
        }
        
        self.updatePersistance()
    }
    
    
    func getCoins() -> Int {
        return self.coins
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
        self.defaults.set(self.accumulatedCoins, forKey: StorageKeys.accumulatedCoins.rawValue)
        self.defaults.set(self.highScore, forKey: StorageKeys.highScore.rawValue)
        self.defaults.set(self.coins, forKey: StorageKeys.coinAmount.rawValue)
        
        if let data = try? JSONEncoder().encode(self.skinManager) {
            self.defaults.set(data, forKey: StorageKeys.skinManager.rawValue)
        }
    }
    
    
    func isSkinSelected(_ named: String) -> Bool {
        return named == self.skinManager.currentSkin
    }
    
    func isUnlocked(_ named: String) -> Bool {
        return self.skinManager.unlockedSkins.contains(named)
    }
    
    func unlock(skin named: String) {
        if self.getCoins() > 10000 {
            self.skinManager.unlockedSkins.append(named)
            self.coins -= 10000
        }
        self.updatePersistance()
        self.objectWillChange.send()
        CoinListener.instance.udpateCoinUI()
    }
    
    func select(skin named: String) {
        self.skinManager.currentSkin  = named
        self.updatePersistance()
        self.objectWillChange.send()
    }
    
    func deselect(skin named: String) {
        self.skinManager.currentSkin  = nil
        self.updatePersistance()
        
        self.objectWillChange.send()
    }
    
    func getCurrentSkinName() -> String {
        if let currentSkin = self.skinManager.currentSkin {
            if currentSkin == "Dotty" {
                return "alienBeige"
            }
            
            if currentSkin == "Bloxy" {
                return "alienPink"
            }
            
            if currentSkin == "Jumpzy" {
                return "alienGreen"
            }
            
            if currentSkin == "Canvy" {
                return "alienYellow"
            }
        }
        
        return "alienBlue"
    }
    
}

