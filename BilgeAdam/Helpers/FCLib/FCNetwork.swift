//
//  FCNetwork.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import Alamofire
import SystemConfiguration

enum URLs: String {
    case baseURL = "http://fatihcimen.com/bilgeadam/match_results.json"
}

class FCNetwork {
    
    //MARK: - Internet Connection Check
     private class func isReachable() -> Bool {
        guard let reachability = SCNetworkReachabilityCreateWithName(nil, "google.com") else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        let isReachable = flags.contains(.reachable)
        
        return isReachable
    }
    
    //MARK: - Get Matches
    class func getMatches(url: URLs = .baseURL, completionHandler: @escaping(League?) -> ()) {
        guard isReachable() else {
            completionHandler(nil)
            errorMessage(message: "noInternetConnection".localized)
            return
        }
        
        Alamofire.request(url.rawValue).responseJSON() {
            response in
            
            if let error = response.error {
                errorMessage(message: error.localizedDescription)
                completionHandler(nil)
                return
            }
            
            if let json = response.result.value as? [String: AnyObject], let league = generateLeagueModel(leagueJson: json) {
                completionHandler(league)
            }else {
                completionHandler(nil)
                return
            }
        }
    }
    
    private class func generateLeagueModel(leagueJson: [String: AnyObject]) -> League? {
        guard let leagueName = leagueJson["name"] as? String, let roundsJson = leagueJson["rounds"] as? [[String: AnyObject]] else {
            errorMessage(message: "jsonErrorLeague".localized)
            return nil
        }
        
        var rounds = [Round]()
        
        for roundJson in roundsJson {
            guard let round = generateRoundsModel(roundsJson: roundJson) else {
                errorMessage(message: "jsonErrorRounds".localized)
                return nil
            }
            rounds.append(round)
        }
        
        let league = League(name: leagueName, rounds: rounds)
        
        return league
    }
    
    private class func generateRoundsModel(roundsJson: [String: AnyObject]) -> Round? {
        guard let name = roundsJson["name"] as? String, let matchesJson = roundsJson["matches"] as? [[String: AnyObject]] else {
            errorMessage(message: "jsonErrorMatches".localized)
            return nil
        }
        
        var matches = [Match]()
        
        for matchJson in matchesJson {
            guard let match = generateMatchModel(matchesJson: matchJson) else{
                errorMessage(message: "jsonErrorMatches".localized)
                return nil
            }
            
            matches.append(match)
        }
        let round = Round(name: name, matches: matches)
        
        return round
    }
    
    private class func generateMatchModel(matchesJson: [String: AnyObject]) -> Match? {
        guard let date = matchesJson["date"] as? String, let team1 = matchesJson["team1"] as? [String: AnyObject], let team2 = matchesJson["team2"] as? [String: AnyObject], let homeTeam = generateTeamModel(teamJson: team1), let awayTeam = generateTeamModel(teamJson: team2) else {
            
            errorMessage(message: "jsonErrorMatches".localized)
            
            return nil
        }
        
        var homeScore = -1
        var awayScore = -1
        
        if let score1 = matchesJson["score1"] as? Int {
            homeScore = score1
        }
        
        if let score2 = matchesJson["score2"] as? Int {
            awayScore = score2
        }
        
        let convertedDate = stringToDateConvert(date: date, format: "yyyy-MM-dd")
        
        let match = Match(date: convertedDate, homeScore: homeScore, awayScore: awayScore, homeTeam: homeTeam, awayTeam: awayTeam)
        
        return match
    }
    
    private class func generateTeamModel(teamJson: [String: AnyObject]) -> Team? {
        guard let key = teamJson["key"] as? String, let name = teamJson["name"] as? String, let code = teamJson["code"] as? String else{
            errorMessage(message: "jsonErrorTeam".localized)
            return nil
        }
        
        let team = Team(key: key, name: name, code: code)
        
        return team
    }
}
