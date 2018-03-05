//
//  FCProgressView.swift
//  BilgeAdam
//
//  Created by Fatih Çimen on 5.03.2018.
//  Copyright © 2018 Fatih Çimen. All rights reserved.
//

import UIKit

class FCProgressView: FCView {
    
    lazy var contentView: FCView = {
        let view = FCView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        view.backgroundColor = UIColor(red:0.17, green:0.23, blue:0.25, alpha:1.00)
        view.roundedCorner = 20
        return view
    }()
    
    lazy var bacgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 80, height: 80)
        return imageView
    }()
    
    lazy var logoView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "ball"))
        imageView.frame.size = CGSize(width: 80, height: 80)
        imageView.contentMode = .center
        return imageView
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        makeViews()
    }
    
    func makeViews()  {
        addSubview(contentView)
        contentView.addSubview(logoView)
        
        UIView.animate(withDuration: 3, delay: 0.0, options:[.repeat, .autoreverse], animations: {
            self.logoView.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: nil)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 80)
    }
}
