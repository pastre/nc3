//
//  Mission.swift
//  NC3
//
//  Created by Bruno Pastre on 20/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class Mission {
    
    internal init(task: Task?, progress: Double?) {
        self.task = task
        self.progress = progress
    }
    
    var task: Task!
    var progress: Double!
}
