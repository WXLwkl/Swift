//
//  MoveCollectionViewCell.swift
//  CollectionView
//
//  Created by xingl on 2019/1/25.
//  Copyright © 2019 xingl. All rights reserved.
//

import UIKit

class MoveCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func begainAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = -Double.pi / 40
        animation.toValue = Double.pi / 40
        animation.duration = 0.15
        animation.isRemovedOnCompletion = false
        animation.repeatCount = MAXFLOAT
        animation.autoreverses = true
        layer.add(animation, forKey: "animation")
    }
    
    func stopAnimation() {
        layer.removeAllAnimations()
    }
}
