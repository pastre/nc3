//
//  StoreFacade.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import StoreKit
import Combine

class StoreManager: NSObject,ObservableObject, SKProductsRequestDelegate {
    
    static let instance = StoreManager()
    private var request:  SKProductsRequest!
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        DispatchQueue.main.async {
            
            self.products = response.products
            print("[IAP] Recvd", response.products.count, "products from appstore")
            self.objectWillChange.send()
        }
        
        
    }

    @Published var hasFired: Bool! = false
    @Published var products: [SKProduct]?
    
    override private init() {
        super.init()
        
        self.request = SKProductsRequest(productIdentifiers: ["bulkyCoinPack", "hugeCoinPack","roomyCoinPack", "tinyCoinPack","TinyCoinPack", "smallestCoinPack"])
        self.request.delegate = self
        
    }
    
    func fire() {
        
        self.request.start()
    }
}
