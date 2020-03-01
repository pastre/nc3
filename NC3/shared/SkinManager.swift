//
//  SkinManager.swift
//  NC3
//
//  Created by Bruno Pastre on 29/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class SkinManager: Encodable, Decodable {
    
    let skinNames = [
        "beige",
        "green",
        "pink",
        "yellow"
    ]
    
    enum CodingKeys: String, CodingKey {
        case unlockedSkins = "unlockedSkins"
        case currentSkin = "currentSkin"
    }
    
    var unlockedSkins:  [String]!
    var currentSkin: String?
    
    init() {
        self.unlockedSkins = [String] ()
    }
    
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.unlockedSkins = try container.decode([String].self, forKey: .unlockedSkins)
        self.currentSkin = try container.decode(String?.self, forKey: .currentSkin)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.unlockedSkins, forKey: .unlockedSkins)
        try container.encode(self.currentSkin, forKey: .currentSkin)
    }
    
}
