//
//  League.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

class League: Decodable {
    
    var name: String
    var rounds: [Round]
    
    init(name: String, rounds: [Round]) {
        self.name = name
        self.rounds = rounds
    }
}
