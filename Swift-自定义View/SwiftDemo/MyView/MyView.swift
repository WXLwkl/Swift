//
//  MyView.swift
//  SwiftDemo
//
//  Created by xingl on 2017/3/27.
//  Copyright © 2017年 yjpal. All rights reserved.
//

import UIKit

class MyView: UIView {

    var iconImage: UIImageView!
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews() {
        iconImage = UIImageView(image: UIImage(named: "2"))
        self.addSubview(iconImage)
        titleLabel = UILabel()
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = .red
        self.addSubview(titleLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        iconImage.frame = CGRect(x: 0, y: 0, width: width, height: width)  //CGRectMake(0, 0, width, width)
        titleLabel.frame = CGRect(x:0, y:width, width:width, height:height - width)
    }
}
