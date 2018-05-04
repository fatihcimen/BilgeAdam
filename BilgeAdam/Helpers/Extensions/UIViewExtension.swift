//
//  UIViewExtension.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 3.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import UIKit
import CWStatusBarNotification
import MBProgressHUD

extension UIView {
    
    // Status Bar Alert
    func statusBarAlert(title: String, duration: TimeInterval, barStyle: CWNotificationStyle = .navigationBarNotification, notificationAnimationStyle: CWNotificationAnimationStyle = .top, backgroundColor: UIColor, textColor: UIColor, tapClosure: CWCompletionBlock? = nil) {
        let notification = CWStatusBarNotification()
        notification.notificationStyle = barStyle
        notification.notificationAnimationInStyle = notificationAnimationStyle
        notification.notificationLabelBackgroundColor = backgroundColor
        notification.notificationLabelTextColor = textColor
        
        let closure : CWCompletionBlock = {
            if let tapClosure = tapClosure {
                tapClosure()
            }
            
            notification.dismiss()
        }
        notification.notificationTappedBlock = closure
        
        notification.display(withMessage: title, forDuration: duration)
    }
}
