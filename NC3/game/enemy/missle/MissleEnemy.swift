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
        return SKPhysicsBody(texture: SKTexture(imageNamed: "missle"), alphaThreshold: 0.9, size: self.getSize())
    }
    
    override func configureTextures() {
        self.stateMachine.enter(MissleTracking.self)
    
        let node = SKSpriteNode(imageNamed: "missle")
        
        node.scale(to: self.getSize())
        node.zPosition = ZPositionManager.MISSLE.rawValue
        
        self.node.addChild(node)
        
        self.prepareForSpawn()
        
    }
    
    override func prepareForSpawn() {
        
        self.timeSinceSpawn = .zero
        self.setSmokeParticle()
    }
    
    func setSmokeParticle() {
        guard let particle = loadParticle(named: "MissleSmoke") else { return }
        
        self.currentParticle?.removeFromParent()
        
        particle.setScale(0.3)
        
        self.currentParticle = particle
        
        self.configureParticle()
    }
    
    func setFireParticle() {
        
        guard let particle = loadParticle(named: "BatcarFire") else { return }
        
        self.currentParticle?.removeFromParent()
        
//        particle.yScale = 4
        particle.setScale(0.2)
        particle.emissionAngle = 0
        
        self.currentParticle = particle
        
        self.configureParticle()
    }
    
    
    func configureParticle(_ forced: Bool = false) {
        guard let currentParticle = self.currentParticle else { return }
        
        self.node.addChild(currentParticle)
        
        currentParticle.position = CGPoint(x: self.getSize().width / 2 + currentParticle.particleSize.width / 2 * currentParticle.particleScale, y: 0)
        currentParticle.zPosition = ZPositionManager.MISSLE.rawValue
    }
    
    override func update(_ deltaTime: TimeInterval) {
        
        self.timeSinceSpawn += deltaTime
        
        if timeSinceSpawn > self.shootThreshold {
            self.stateMachine.enter(MissleShooting.self)
            self.currentParticle?.setScale(0.5)
        } else if timeSinceSpawn > self.lockThreshold {
            self.stateMachine.enter(MissleLocked.self)
            self.setFireParticle()
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
        return CGSize(width: 60, height: 60 )
    }
    
    override func getNodeName() -> String {
        return "enemyMissle"
    }
    
    override func getHorizontalSpeed() -> CGFloat {
        return 2 * super.getHorizontalSpeed()
    }
}
