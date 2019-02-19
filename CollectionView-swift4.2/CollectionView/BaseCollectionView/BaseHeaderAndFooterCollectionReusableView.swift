//
//  BaseHeaderAndFooterCollectionReusableView.swift
//  CollectionView
//
//  Created by xingl on 2019/1/25.
//  Copyright © 2019 xingl. All rights reserved.
//

import UIKit

class BaseHeaderAndFooterCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var textLabel: UILabel!
    
    // 如果全用代码 重写init方法 即可。
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
