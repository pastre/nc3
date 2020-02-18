//
//  MissleEnemy.swift
//  NC2
//
//  Created by Bruno Pastre on 05/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import GameplayKit

class MissleEnemy: Enemy {
    
    var timeSinceSpawn: TimeInterval = TimeInterval(0)
    let stateMachine = GKStateMachine(states: [ MissleTracking(), MissleLocked(), MissleShooting() ])
    
    let lockThreshold = TimeInterval(4)
    let shootThreshold = TimeInterval(5)
    
    var currentParticle: SKEmitterNode?
    
    override func getPhysicsBody() -> SKPhysicsBody {
        return SKPhysicsBody(texture: SKTexture(imageNamed: "bee_fly1"), alphaThreshold: 0.9, size: self.getSize())
    }
    
    override func configureTextures() {
        self.stateMachine.enter(MissleTracking.self)
    
        let node = SKSpriteNode(imageNamed: "bee_fly1")
        let action = AnimationProvider.getBeeFlyingAction()
        
        node.scale(to: self.getSize())
        node.zPosition = ZPositionManager.MISSLE.rawValue
        
        node.run(action)
        self.node.addChild(node)
        
        self.prepareForSpawn()
        
    }
    
    override func prepareForSpawn() {
        
        self.timeSinceSpawn = .zero
        
    }
    
    
    override func update(_ deltaTime: TimeInterval) {
        
        self.timeSinceSpawn += deltaTime
        
        if timeSinceSpawn > self.shootThreshold {
            self.stateMachine.enter(MissleShooting.self)
            
        } else if timeSinceSpawn > self.lockThreshold {
            self.stateMachine.enter(MissleLocked.self)
            
        }

        if self.stateMachine.currentState is MissleTracking {
            self.updateTracking()
            return
        }
        
        if self.stateMachine.currentState is MissleLocked {
            return 
        }
        
        super.update(deltaTime)
    }
    
    func updateTracking() {
        let x = GameObject.getScreenWidth() - 200
        let y = self.scene.getPlayer().node.position.y
        
        self.node.position = CGPoint(x: x, y: y)
    }
    
    func getSize() -> CGSize {
        let ratio = 61/42
        let size = 40
        return CGSize(width: size, height: size * ratio )
    }
    
    override func getNodeName() -> String {
        return "enemyMissle"
    }
    
    override func getHorizontalSpeed() -> CGFloat {
        return 2 * super.getHorizontalSpeed()
    }
}
