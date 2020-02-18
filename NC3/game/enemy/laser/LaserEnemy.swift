//
//  File.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class LaserEnemy: Enemy {
    
    var random: CGFloat! = 30
    
    var textureNode: SKSpriteNode?
    
    override func configureTextures() {
        
        let topSphere = SKSpriteNode(imageNamed: "snake1")
        let action = AnimationProvider.getSnakeWiggleAction()
        
        topSphere.scale(to: self.getSize())
        topSphere.zPosition = ZPositionManager.MOSS_BALL.rawValue
        
        self.node.addChild(topSphere)
        
        topSphere.run(action)
        
        self.textureNode = topSphere
    }
    
    override func getPhysicsBody() -> SKPhysicsBody {
//        return SKPhysicsBody(rectangleOf: self.getSize())
        let texture = SKTexture(imageNamed: "snake1")
        return SKPhysicsBody(texture: texture, size: self.getSize())
    }
    
    override func prepareForSpawn() {
        
        
        self.random = CGFloat.random(in: 30...50)
        
        self.textureNode?.scale(to: self.getSize())
        self.node.zRotation = self.getZRotation()
        self.node.scale(to: self.getSize())
        self.configurePhysics(self.getPhysicsBody())
    }
    
    func getSize() -> CGSize {
        let ratio: CGFloat = 193/53
        print("Configured skane", self.node.children.first?.description)
        return CGSize(width: random, height: random * ratio)
    }
    
    func getZRotation() -> CGFloat {
        let random = Int.random(in: 0...100)
        
        if random < 25 {
            return .pi / 4
        }
        
        if random < 50 {
            return .pi / 2
        }
        
        if random < 75 {
            return CGFloat.pi / -4
        }
        
        return 0
    }
    
}
