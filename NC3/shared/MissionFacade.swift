//
//  MissionFacade.swift
//  NC3
//
//  Created by Bruno Pastre on 21/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

@objc protocol MissionListener {
    @objc func onUpdate()
}


class MissionFacade: MissionListener, ObservableObject {
    
    static let instance = MissionFacade()
    private init() {
        MissionEventBinder.instance.listen(self)
    }
    
    func getMissions() -> [Mission] {
        let missions = MissionPool.instance.missions
        
        return missions!
    }
    
    func onUpdate() {
        self.missions = getMissions()
    }
    
    @Published var missions: [Mission]!
    
}
