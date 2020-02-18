//
//  Player.swift
//  NC2
//
//  Created by Bruno Pastre on 04/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import GameplayKit

class Player: GameObject {
    
    enum Animation {
        case walking
        case flying
    }
    
    var isJetpackOn = false
    private var walkedDistance: CGFloat = 0
    
    let walkingSpeed = 100
    let maxVal: CGFloat = 225
    let minVal: CGFloat = -225
    
    private var currentCoin: Int = 0
    
    let stateMachine: GKStateMachine! = GKStateMachine(states: [PlayerRunning(), PlayerFlying(), PlayerFalling()])
    
    override init(_ node: SKSpriteNode, scene: GameScene) {
        super.init(node, scene: scene)
        
        self.stateMachine.enter(PlayerRunning.self)
        self.node.zPosition = ZPositionManager.PLAYER.rawValue
        
    }
    
    // MARK: - Animation
    
    func setAnimation(to: Animation) {
        let actions = to == .flying ? AnimationProvider.getPlayerFlyingAction() : AnimationProvider.getPlayerWalkingAction()
        
        self.node.removeAllActions()
        self.node.run(actions)
    }
    
    // MARK: Update
    override func update(_ deltaTime: TimeInterval) {
        let body = self.node.physicsBody!
        
        self.walkedDistance += CGFloat(deltaTime) * SpeedManager.instance.getCurrentSpeed()
    
        if isJetpackOn {
            body.applyForce(CGVector(dx: 0, dy: 210))
        }
    
        let clamp: CGFloat = min(max(body.velocity.dy, self.minVal), self.maxVal)
        
        body.velocity.dy = clamp
    
        self.updatePlayerState(body.velocity.dy)
    }
    
    func updatePlayerState(_ dy: CGFloat) {

        if dy == 0 && self.node.position.y < 0  {
            if self.stateMachine.enter(PlayerRunning.self) {
                self.onStartedWalking()
            }
        } else if dy < 0 {
            if self.stateMachine.enter(PlayerFalling.self) {
                self.onStartedFalling()
            }
        } else {
            if self.stateMachine.enter(PlayerFlying.self) {
                self.onStartedFlying()
            }
        }
    }
    
    // MARK: - Event callbacks
    func onStartedWalking() {
        self.setAnimation(to: .walking)
    }
    
    func onStartedFlying() {
        self.setAnimation(to: .flying)
    }
    
    func onStartedFalling() {
        
    }
    
    func onCoinCollected() {
        self.currentCoin += 1
    }
    
    func onJetpackUpdate(to isOn: Bool) {
        self.isJetpackOn = isOn
    }
    
    func reset() {
        self.walkedDistance = 0
        self.currentCoin = 0
    }
    
    // MARK: - Getters
    func getWalkingDistance() -> Int {
        return Int(self.walkedDistance / 50)
    }
    
    func getCoinCount() -> Int {
        return self.currentCoin
    }
    
    override func getNodeName() -> String {
        return "player"
    }
}
