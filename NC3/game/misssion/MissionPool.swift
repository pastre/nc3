//
//  TaskGenerator.swift
//  NC3
//
//  Created by Bruno Pastre on 20/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class MissionPool: Encodable, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case missions = "missions"
    }
    
     init() {
        self.missions = [
            WalkMisson(),
            WalkMisson(),
            WalkMisson(),
        ]
    }
    
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.missions = try container.decode([Mission].self, forKey: .missions)
    }
    
    func persistMissions() {
        
    }
    
    var missions: [Mission]!
}
