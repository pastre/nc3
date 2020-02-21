//
//  TaskGenerator.swift
//  NC3
//
//  Created by Bruno Pastre on 20/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class MissionPool {
    
    static let instance = MissionPool()
    private init() {
        self.missions = [
            WalkMisson(),
            WalkMisson(),
            WalkMisson(),
        ]
    }
    
    var missions: [Mission]!
}
