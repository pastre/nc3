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
    
    @Published var missions: [Mission]!
    @Published var completedMissions: [Mission]?
    
    static let instance = MissionFacade()
    var missionPool: MissionPool!
    
    private init() {
        MissionEventBinder.instance.listen(self)
        
        self.missionPool = MissionFacade.loadMissions() ?? MissionPool()
        
        self.persistMissions()
        self.missions = self.getMissions()
    }
    
    func getMissions() -> [Mission] {
        
        return self.missionPool.missions
    }
    
    func onUpdate() {
        self.missions = getMissions()
        
        self.updateMissionUI()
    }
    
    func updateMissionUI() {
        self.persistMissions()
        self.objectWillChange.send()
    }
    
    func persistMissions() {
        if let data = try? JSONEncoder().encode(self.missionPool) {
            UserDefaults.standard.set(data, forKey: "missionPool")
            print("[Persistance] Updated missions to storage")
        }
    }
    
    private static func loadMissions() -> MissionPool? {
        if let data = UserDefaults.standard.data(forKey: "missionPool") {
            
            let loaded = try? JSONDecoder().decode(MissionPool.self, from: data)
            print("[Persistance] Loaded missions from storage", loaded)
            return loaded
        }
        
        return nil
    }
    
}
