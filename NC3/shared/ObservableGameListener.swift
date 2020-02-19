//
//  ObservableGameListener.swift
//  NC3
//
//  Created by Bruno Pastre on 18/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class ObservableGameListener: ObservableObject, GameEventListener {
    func onGameStart() {
        self.isPlaying = true
        self.isGameOver = false
        self.objectWillChange.send()
    }
    
    func onGameOver() {
        self.isGameOver = true
        self.isPlaying = false
        self.objectWillChange.send()
    }
    
    func goHome() {
        self.isGameOver = false
        self.isPlaying = false
        self.objectWillChange.send()
    }
    
    private init() {
        GameEventBinder.instance.subscribe(self)
    }
    
    static let instance = ObservableGameListener()
    
    @Published var isPlaying: Bool = false
    @Published var isGameOver: Bool = false
    
}
