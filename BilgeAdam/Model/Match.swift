//
//  Match.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

class Match: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case teamHome = "team1"
        case teamAway = "team2"
        case scoreHome = "score1"
        case scoreAway = "score2"
        case date
    }
    
    var date: String
    var teamHome: Team
    var teamAway: Team
    var scoreHome: Int?
    var scoreAway: Int?
    
    init(date: String, teamHome: Team, teamAway: Team, scoreHome: Int, scoreAway: Int) {
        self.date = date
        self.teamHome = teamHome
        self.teamAway = teamAway
        self.scoreHome = scoreHome
        self.scoreAway = scoreAway
    }
}
