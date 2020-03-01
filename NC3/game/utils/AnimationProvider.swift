//
//  AnimationProvider.swift
//  NC3
//
//  Created by Bruno Pastre on 17/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class AnimationProvider {
    
    static func getPlayerWalkingAction() -> SKAction{
        return self.getAction(amount: 2, baseName: StorageFacade.instance.getCurrentSkinName() + "_walk")
    }
    
    static func getPlayerFlyingAction() -> SKAction {
        return self.getAction(amount: 2, baseName: StorageFacade.instance.getCurrentSkinName() + "_swim")
    }
    
    static func getBatFlyingAction() -> SKAction {
        return self.getAction(amount: 2, baseName: "bat_fly", timePerFrame: 0.2)
    }
    
    static func getSnakeWiggleAction() -> SKAction {
        return self.getAction(amount: 2, baseName: "snake")
    }
    
    static func getBeeFlyingAction() -> SKAction {
        
        return self.getAction(amount: 2, baseName: "bee_fly")
    }
    
    static func getAlienAction() {
        
    }
    
    private static func getAction(amount: Int, baseName: String, timePerFrame: TimeInterval = 0.1) -> SKAction {
        
        let loader = AnimationLoader(amount: amount, baseName: baseName)
        let frames = loader.getTextures()
        let action = SKAction.animate(with: frames, timePerFrame: timePerFrame)
        
        return SKAction.repeatForever(action)
    }
    
}

fileprivate class AnimationLoader {
    internal init(amount: Int?, baseName: String?) {
        self.amount = amount
        self.baseName = baseName
    }
    
    var amount: Int!
    var baseName: String!
    
    func getTextures() -> [SKTexture] {
        var ret = [SKTexture]()
        for i in 1...amount {
            let texture = SKTexture(imageNamed: baseName + String(i))
            ret.append(texture)
        }
        
        return ret
    }
}
