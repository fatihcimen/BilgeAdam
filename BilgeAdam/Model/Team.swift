//
//  Team.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import Foundation

class Team: Decodable {
    
    var key: String
    var name: String
    var code: String
    var iconURL: URL? {
        get {
            return URL(string: "http://fatihcimen.com/bilgeadam/badges/\(self.code).png")!
        }
    }
    
    init(key: String, name: String, code: String) {
        self.key = key
        self.name = name
        self.code = code
    }
}
