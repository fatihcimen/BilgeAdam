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

    init(key: String!, name: String!, code: String!) {
        self.key = key
        self.name = name
        self.code = code
        self.iconURL = generateTeamBadgeURL(code: code)
    }
    
    private func generateTeamBadgeURL(code: String) -> URL {
        return URL(string: "http://fatihcimen.com/bilgeadam/badges/\(code).png")!
    }
}
