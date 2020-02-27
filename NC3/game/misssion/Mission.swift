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
        self.progress = 0
        MissionEventBinder.instance.bind(class: self, to: toEvent)
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let eventType = try container.decode(String.self, forKey: .eventType)
        
        self.progress = try container.decode(Int.self, forKey: .progress)
        self.eventType = MissionEventBinder.Event(rawValue: eventType)!
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.progress, forKey: .progress)
        try container.encode(self.eventType.rawValue, forKey: .eventType)
    }
    
    @objc func onEvent() {
        switch self.eventType {
        case .walk:
            self.onWalkMissionUpdate()
        default:
            break
        }
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

