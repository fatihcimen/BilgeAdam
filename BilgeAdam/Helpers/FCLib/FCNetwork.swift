//
//  FCNetwork.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import Alamofire

class FCNetwork {
    
    private static let baseURL = "https://fatihcimen.com/bilgeadam/match_results.json"
    
    class func getJSON<T: Decodable>(method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, type: T.Type, completionHandler: @escaping(T?) -> ()) {
        guard let reachability = FCNetworkStatus.shared.isReachable(), reachability else {
            errorMessage(message: "noInternetConnection".localized)
            completionHandler(nil)
            return
        }
        
        showIndicator()
        
        Alamofire.request(baseURL, method: method, parameters: parameters, headers: headers).responseJSON() {
            response in
            
            hideIndicator()
            
            guard let data = response.data else {
                completionHandler(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let json = try decoder.decode(T.self, from: data)
                completionHandler(json)
            }catch let error {
                errorMessage(message: error.localizedDescription)
                completionHandler(nil)
            }
        }
    }
}
