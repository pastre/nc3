//
//  CoinListener.swift
//  NC3
//
//  Created by Bruno Pastre on 29/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class CoinListener: ObservableObject {
    
    private init() {
        self.coinCount = StorageFacade.instance.getCoins()
    }
    
    func udpateCoinUI () {
        self.coinCount = StorageFacade.instance.getCoins()
        self.objectWillChange.send()
    }
    
    static let instance = CoinListener()
    
    @Published var coinCount: Int!

}
