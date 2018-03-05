//
//  Team.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import Foundation

class Team {
    
    var key: String!
    var name: String!
    var code: String!
    var iconURL: URL!

    init(key: String!, name: String!, code: String!, iconURL: URL!) {
        self.key = key
        self.name = name
        self.code = code
        self.iconURL = iconURL
    }
}
