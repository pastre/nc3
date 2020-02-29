//
//  StoreFacade.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import StoreKit
import Combine

class StoreManager: NSObject, SKProductsRequestDelegate {
    
    static let instance = StoreManager()
    private var request:  SKProductsRequest!
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("request", request, "response", response)
        
        self.products = response.products
        
    }

    @Published var hasFired: Bool! = false
    @Published var products = [SKProduct]()

    override private init() {
        super.init()
        
        self.request = SKProductsRequest(productIdentifiers: ["bigCoinPack", "mediumCoinPack","smallCoinPack", "tinyCoinPack",])
        self.request.delegate = self
        
    }
    
    func fire() {
        
        self.request.start()
    }
}
