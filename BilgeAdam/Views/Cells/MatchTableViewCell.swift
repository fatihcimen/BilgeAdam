//
//  MatchTableViewCell.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 5.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import UIKit
import Kingfisher

class MatchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamBadgeImageView: UIImageView!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamBadgeImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var match: Match! {
        didSet {
            
            //Home Team
            homeTeamNameLabel.text = match.homeTeam.name
            
            let homeTeamBadgeURL = generateTeamBadgeURL(code: match.homeTeam.code)
            homeTeamBadgeImageView.kf.setImage(with: homeTeamBadgeURL)
            
            //Score Text
            let score = getScoreText(homeScore: match.homeScore, awayScore: match.awayScore)
            scoreLabel.text = score
            
            //Away Team
            awayTeamNameLabel.text = match.awayTeam.name
            
            let awayTeamBadgeURL = generateTeamBadgeURL(code: match.awayTeam.code)
            awayTeamBadgeImageView.kf.setImage(with: awayTeamBadgeURL)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func getScoreText(homeScore: Int?, awayScore: Int?) -> String {
        var score = "-:-"
        
        if let homeTeamScore = homeScore, homeTeamScore != -1 {
            score = "\(homeTeamScore):"
        }else {
            score = "-:"
        }
        
        if let awayTeamScore = awayScore, awayTeamScore != -1 {
            score += "\(awayTeamScore)"
        }else {
            score += "-"
        }
        
        return score
    }
    
    private func generateTeamBadgeURL(code: String) -> URL {
        return URL(string: "http://fatihcimen.com/bilgeadam/badges/\(code).png")!
    }
}
