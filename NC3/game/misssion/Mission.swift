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
    var eventType: MissionEventBinder.Event

    init(order: String?, goal: ClosedRange<Int>, reward: Int?, bind toEvent: MissionEventBinder.Event) {
        self.eventType = toEvent
        super.init(order: order, goal: goal, reward: reward)
    
        MissionEventBinder.instance.bind(class: self, to: toEvent)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.progress = try container.decode(Int.self, forKey: .progress)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        
        
        try container.encode(self.progress, forKey: .progress)
    }
    
    @objc func onEvent() {
        
    }
    
    override func isComplete() -> Bool {
        return self.progress == self.getGoal()
    }
    
    func getDescription() -> String{
           return "\(self.order!) \(self.getGoal())"
       }
    
    func getProgressDescription() -> String {
        return "\(self.progress!)/\(self.getGoal())"
    }
    
    func onWalkMissionUpdate() {
        let walkedDistance = Player.getWalkingDistance()
        
        self.progress += walkedDistance
    
    }
}

