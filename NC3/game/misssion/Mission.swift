//
//  Mission.swift
//  NC3
//
//  Created by Bruno Pastre on 20/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class Mission: Task {
    
    var progress: Int!
    
    override init(order: String?, goal: ClosedRange<Int>, reward: Int?) {
        super.init(order: order, goal: goal, reward: reward)
        self.bind()
    }
    
    @objc func bind() {
        
    }
    
    func getDescription() -> String{
        fatalError()
    }
}

class WalkMisson: Mission {
    
    init() {
        super.init(order: "Walk", goal: 100...200, reward: 2)
        self.progress = 0
    }
    
    override func bind() {
        MissionEventBinder.instance.bind(class: self, to: .walk)
    }
    
    
    override func isComplete() -> Bool {
        return self.progress == self.getGoal()
    }
    
    override func getDescription() -> String{
        return "\(self.order!) \(self.getGoal())"
    }
 
    func getProgressDescription() -> String {
        return "\(self.progress!)/\(self.getGoal())"
    }
}
