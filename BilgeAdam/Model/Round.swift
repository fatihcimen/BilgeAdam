//
//  Round.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

class Round: Decodable {
    
    var name: String
    var matches: [Match]
    
    init(name: String, matches: [Match]) {
        self.name = name
        self.matches = matches
    }
}
