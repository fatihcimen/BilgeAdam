//
//  MatchdayCollectionViewCell.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import UIKit
import Kingfisher

class MatchdayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var round: Round! {
        didSet {
            
            //MARK: - Matchdays
            if round.name.hasPrefix("Matchday") {
                let matchdayArray = splitMatchday(string: round.name)
                                
                self.titleLabel.text = matchdayArray[0]
                self.dayLabel.text = matchdayArray[1]
            }else {
                self.titleLabel.text = round.name
                self.dayLabel.text = nil
            }
            
            //MARK: - Background Image
            let link = generateImageLink()
            let url = URL(string: link)!
            
            imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "matchday-placeholder"))
        }
    }
    
    //MARK: - Image    
    //Generate Image Link
    private func generateImageLink() -> String {
        let imageName = "\(arc4random_uniform(17) + 1).jpg"
        
        return "http://fatihcimen.com/bilgeadam/backgrounds/\(imageName)"
    }
    
    //MARK: - Split Function
    private func splitMatchday(string: String) -> [String] {
        return string.components(separatedBy: " ")
    }
}
