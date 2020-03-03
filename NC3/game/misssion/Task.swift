//
//  Task.swift
//  NC3
//
//  Created by Bruno Pastre on 20/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class Task: Identifiable, Encodable, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case order = "order"
        case goalRange = "goalRange"
        case rewardMultiplier = "rewardMultiplier"
        case computedGoal = "computedGoal"
        
        case progress = "progress"
        case eventType = "eventType"
    }
    
    var order: String!
    var goalRange: ClosedRange<Int>
    var rewardMultiplier: Int!
    var computedGoal: Int?
    
    internal init(order: String?, goal: ClosedRange<Int>, reward: Int?) {
        self.order = order
        self.goalRange = goal
        self.rewardMultiplier = reward
        
    }

    required init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        
        self.order = try container.decode(String.self, forKey: .order)
        self.goalRange = try container.decode(ClosedRange<Int>.self, forKey: .goalRange)
        self.rewardMultiplier = try container.decode(Int.self, forKey: .rewardMultiplier)
        self.computedGoal = try container.decode(Int.self, forKey: .computedGoal)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.order, forKey: .order)
        try container.encode(self.goalRange, forKey: .goalRange)
        try container.encode(self.rewardMultiplier, forKey: .rewardMultiplier)
        try container.encode(self.computedGoal, forKey: .computedGoal)
        
    }
    
    func getGoal() -> Int {
        if let goal = self.computedGoal {
            return goal
        }
        
        self.computedGoal = Int.random(in: self.goalRange)
        return self.getGoal()
    }
    
    func getReward() -> Int {
        return Int(Double(self.getGoal()) * 0.2)
    }
    
    func isComplete() -> Bool {
        fatalError("\(self) did not implement isComplete")
    }
}

