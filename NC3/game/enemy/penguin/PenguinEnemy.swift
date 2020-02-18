//
//  PenguinEnemy.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit


class PenguinEnemy: Enemy {
    
    var gravity: CGFloat = 50
    
    override func getPhysicsBody() -> SKPhysicsBody {
        let texture = SKTexture(imageNamed: "bat_fly1")
        
        let body = SKPhysicsBody(texture: texture, alphaThreshold: 0.9, size: self.getSize())
        
        return body
        
    }
    
    override func prepareForSpawn() {
    
        self.gravity = .random(in: 20...80)
        
        if let node = self.node.children.first {

            let action = AnimationProvider.getBatFlyingAction()
            
            node.removeAllActions()
            node.run(action)
        }
        
    }
    
    override func update(_ deltaTime: TimeInterval) {
        super.update(deltaTime)
        
        let dY = CGFloat(deltaTime) * (self.gravity + super.getHorizontalSpeed() * UIScreen.main.bounds.height / UIScreen.main.bounds.width)
        
        self.node.position.y -= dY
    }
    
    override func configureTextures() {
        let sphere = SKSpriteNode(imageNamed: "bat_fly1")
        
        sphere.scale(to: self.getSize())
        sphere.zPosition = ZPositionManager.PENGUIN.rawValue
        
        self.node.addChild(sphere)
        
        let action = AnimationProvider.getBatFlyingAction()
        self.node.run(action)
        
    }
    
    func getSize() -> CGSize {
        let height = 40
        
        return CGSize(width: height * 88/37, height: height)
    }
    
    override func getHorizontalSpeed() -> CGFloat {
        return 2 * super.getHorizontalSpeed()
    }
    
}
