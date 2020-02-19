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
    }
    
    var playerBank: PlayerBank!
    
    static let instance = StorageFacade()
    let defaults = UserDefaults.standard
    
    private init() {
        let coinAmount = defaults.integer(forKey: StorageKeys.coinAmount.rawValue)

        self.playerBank = PlayerBank(coins: coinAmount)
        
    }
    
    func onCoinsReceived(_ amount: Int) {
        
        self.playerBank.addCoins(amount)
        self.updatePersistance()
    }
    
    func updatePersistance(){
        self.defaults.set(self.playerBank.coins, forKey: StorageKeys.coinAmount.rawValue)
    }
}


class PlayerBank {
    internal init(coins: Int = 0) {
        self.coins = coins
    }
    
    func addCoins(_ amount: Int) {
        self.coins += amount
    }
    
    
    var coins: Int!
}
