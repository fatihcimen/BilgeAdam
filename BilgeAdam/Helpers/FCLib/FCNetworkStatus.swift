//
//  FCNetworkStatus.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 4.05.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import Alamofire

class FCNetworkStatus {
    
    static let shared = FCNetworkStatus()
    
    private let reachabilityManager = NetworkReachabilityManager()
    
    func startReachability() {
        reachabilityManager?.startListening()
    }
    
    func stopReachability() {
        reachabilityManager?.stopListening()
    }
    
    func isReachable() -> Bool? {
        return reachabilityManager?.isReachable
    }
}
