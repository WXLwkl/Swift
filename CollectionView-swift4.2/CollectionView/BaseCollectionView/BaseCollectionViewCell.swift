//
//  BaseCollectionViewCell.swift
//  CollectionView
//
//  Created by xingl on 2019/1/25.
//  Copyright © 2019 xingl. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    private var textLabel: UILabel!
    
    var cellIndex: Int = 0 {
        didSet {
            textLabel.text = "\(cellIndex)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textLabel = UILabel()
        textLabel.textAlignment = .center
        contentView.addSubview(textLabel)
        backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel.frame = bounds
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .lightGray
            } else {
                contentView.backgroundColor = nil
            }
            super.isSelected = isSelected
        }
    }
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                contentView.backgroundColor = .purple
            } else {
                contentView.backgroundColor = nil
            }
            super.isHighlighted = isHighlighted
        }
    }
}
