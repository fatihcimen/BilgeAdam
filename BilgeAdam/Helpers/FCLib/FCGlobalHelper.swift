//
//  FCGlobalHelper.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import UIKit

func errorMessage(message: String, duration: Double = 2.5) {
    if let rootView = UIApplication.shared.windows[0].rootViewController?.view {
        let backgroundColor = UIColor(red:0.98, green:0.26, blue:0.31, alpha:1.00)
        let textColor: UIColor = .white
        
        rootView.statusBarAlert(title: message, duration: duration, barStyle: .navigationBarNotification, notificationAnimationStyle: .top, backgroundColor: backgroundColor, textColor: textColor)
    }
}

func stringToDateConvert(date: String, format: String) -> Date {
    let dateFormat = dateFormatter(format: format)
    
    return dateFormat.date(from: date)!
}

private func dateFormatter(format: String) -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = .current
    dateFormatter.timeZone = .current
    return dateFormatter
}
