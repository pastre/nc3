//
//  Task.swift
//  NC3
//
//  Created by Bruno Pastre on 20/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class Task: Identifiable {
    
    
    
    var computedGoal: Int?
    
    internal init(order: String?, goal: ClosedRange<Int>, reward: Int?) {
        self.order = order
        self.goalRange = goal
        self.rewardMultiplier = reward
        
    }
    
    var order: String!
    var goalRange: ClosedRange<Int>
    var rewardMultiplier: Int!
    
    func getGoal() -> Int {
        if let goal = self.computedGoal {
            return goal
        }
        
        self.computedGoal = Int.random(in: self.goalRange)
        return self.getGoal()
    }
    
    func getReward() -> Int {
        return self.getGoal() * self.rewardMultiplier
    }
    
    func isComplete() -> Bool {
        fatalError("\(self) did not implement isComplete")
    }
}

