//
//  AdDelegateWrapper.swift
//  NC3
//
//  Created by Bruno Pastre on 01/03/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

import GoogleMobileAds

class AdDelegateWrapper: NSObject, GADRewardedAdDelegate, GADRewardBasedVideoAdDelegate {
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        
        self.missionView.mission.isAdComplete = true
        self.missionView.isDirty.toggle()
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("recvd?")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        print("failed")
    }
    
    
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        self.missionView.mission.isAdComplete = true
        self.missionView.isDirty.toggle()
    }
    
    var missionView: MissionView!
    
    init(missionView: MissionView) {
        self.missionView = missionView
    }
}

