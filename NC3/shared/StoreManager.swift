//
//  StoreFacade.swift
//  NC3
//
//  Created by Bruno Pastre on 28/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import StoreKit
import Combine

class StoreManager: NSObject,ObservableObject, SKProductsRequestDelegate, SKPaymentTransactionObserver, SKPaymentQueueDelegate {
    
    // MARK: - SKPaymentTransactionObserver
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for t in transactions {
            if t.transactionState == .purchased {
                
                for product in self.products! {
                    if product.productIdentifier == t.payment.productIdentifier {
                        let coinAmount = product.localizedDescription.replacingOccurrences(of: " coins", with: "").replacingOccurrences(of: ".", with: "")
                        StorageFacade.instance.onCoinsReceived(Int(coinAmount)!, true)
                        CoinListener.instance.udpateCoinUI()
                    }
                }
                
                queue.finishTransaction(t)
            }
            
        }
        
        
    }
    
    
    // MARK: - SKProductsRequestDelegate
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.products = response.products
            print("[IAP] Recvd", response.products.count, "products from appstore")
            self.objectWillChange.send()
        }
    }
    
    
    override private init() {
        super.init()
        
        self.request = SKProductsRequest(productIdentifiers: ["bulkyCoinPack", "hugeCoinPack","roomyCoinPack", "tinyCoinPack","TinyCoinPack", "smallestCoinPack"])
        self.request.delegate = self
        
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().delegate = self
    }
    
    func buy(product: SKProduct) {
        let payment = SKPayment(product: product)
        
        SKPaymentQueue.default().add(payment)
    }
    
    func fire() {
        
        self.request.start()
    }
    
    static let instance = StoreManager()
    private var request:  SKProductsRequest!
    
    
    @Published var hasFired: Bool! = false
    @Published var products: [SKProduct]?
}

extension SKProduct {
    /// - returns: The cost of the product formatted in the local currency.
    var regularPrice: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        return formatter.string(from: self.price)
    }
}

