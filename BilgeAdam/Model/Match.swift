//
//  Match.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import Foundation

class Match {
    
    var date: Date!
    var homeScore: Int?
    var awayScore: Int?
    var homeTeam: Team!
    var awayTeam: Team!

    init(date: Date!, homeScore: Int?, awayScore: Int?, homeTeam: Team!, awayTeam: Team!) {
        self.date = date
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
    }
}
