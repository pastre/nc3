//
//  Task.swift
//  NC3
//
//  Created by Bruno Pastre on 20/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class Task {
    
    internal init(order: String?, goal: String?, condition: String?, reward: Int?) {
        self.order = order
        self.goal = goal
        self.condition = condition
        self.reward = reward
    }
    
    var order: String!
    var goal: String!
    var condition: String!
    var reward: Int!
}
