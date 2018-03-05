//
//  MatchdayViewController.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import UIKit

class MatchdayViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let refreshControl = UIRefreshControl()
    
    var rounds = [Round]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        } else {
            collectionView.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(getLeagueData), for: .valueChanged)
        
        getLeagueData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func getLeagueData() {
        self.view.showIndicator()
        FCNetwork.getMatches() {
            league in
            
            if let league = league {
                self.title = league.name
                self.rounds = league.rounds
            }
            
            self.view.hideIndicator()
            self.refreshControl.endRefreshing()
        }
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier, let indexPath = sender as? IndexPath, segueIdentifier == "detailSegue" {
            let row = indexPath.row
            let destination = segue.destination as! MatchViewController
            
            destination.round = rounds[row]
        }
    }
}

//MARK: - CollectionView Data Source and Delegate
extension MatchdayViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MatchdayCollectionViewCell
        
        let row = indexPath.row
        let item = rounds[row]
        
        cell.round = item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellSize = CGSize(width: screenWidth / 2, height: screenWidth / 2)
        
        return cellSize
    }
}
