//
//  MatchViewController.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 5.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var round: Round!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = round.name
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - TableView Data Source and Delegate
extension MatchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return round.matches.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MatchTableViewCell
        
        let row = indexPath.row
        let item = round.matches[row]
        
        cell.match = item
        
        return cell
    }
}
