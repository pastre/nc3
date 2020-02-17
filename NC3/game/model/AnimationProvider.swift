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
        let frames = self.loadFrames(amount: 2, baseName: "alienBlue_walk")
        let action = SKAction.animate(with: frames, timePerFrame: 0.1)
        
        return SKAction.repeatForever(action)
    }
    
    static func getPlayerFlyingAction() -> SKAction {
        
        let frames = self.loadFrames(amount: 2, baseName: "alienBlue_swim")
        let action = SKAction.animate(with: frames, timePerFrame: 0.1)
        
        return SKAction.repeatForever(action)
    }
    
    static func loadFrames(amount: Int, baseName: String) -> [SKTexture] {
        let loader = AnimationLoader(amount: amount, baseName: baseName)
        return loader.getTextures()
    }
    
}

internal class AnimationLoader {
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
