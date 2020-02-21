//
//  MissionEventBinder.swift
//  NC3
//
//  Created by Bruno Pastre on 21/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation


class MissionEventBinder {
    
    enum Event: String {
        case walk = "walk"
        case all = "all"
        func getNotificationName() -> Notification.Name {
            return Notification.Name.init(self.rawValue)
        }
    }
    
    let center = NotificationCenter.default
    
    static let instance = MissionEventBinder()
    private init(){}
    
    
    func bind(class c: Mission, to: Event){
        self.center.addObserver(self, selector: #selector(c.bind), name: to.getNotificationName(), object: nil)
    }
    
    func publish(notification: Event, _ payload: [AnyHashable : Any]? = nil) {
        self.center.post(name: notification.getNotificationName(), object: nil, userInfo: payload)
        self.center.post(name: Event.all.getNotificationName(), object: nil, userInfo: payload)
    }
    
    func listen(_ clasz: MissionListener) {
        self.center.addObserver(self, selector: #selector(clasz.onUpdate), name: Event.all.getNotificationName(), object: nil)
    }
}
