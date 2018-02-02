//
//  LocalPictureController.swift
//  CyclePictureView
//
//  Created by wl on 15/11/7.
//  Copyright © 2015年 wl. All rights reserved.
//

import UIKit

class LocalPictureController: UIViewController, CyclePictureViewDelegate {
    
    var cyclePictureView: CyclePictureView!
    var localImageArray: [String] = {
        
        var array: [String] = []
        for i in 1...1 {
            array.append("\(i)")
        }
        return array
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cyclePictureView = CyclePictureView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 200), localImageArray: localImageArray)
        cyclePictureView.backgroundColor = UIColor.red
        cyclePictureView.delegate = self
        cyclePictureView.timeInterval = 3
        cyclePictureView.pageControlAliment = .rightBottom
        self.view.addSubview(cyclePictureView)
        
        self.cyclePictureView = cyclePictureView
        
    }

    deinit {
        //print("LocalPictureController----deinit")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.cyclePictureView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width - 100, height: 150)
        cyclePictureView.currentDotColor = UIColor.red
    }
    
    func cyclePictureView(_ cyclePictureView: CyclePictureView, didSelectItemAtIndexPath indexPath: IndexPath) {
        //print(indexPath.item)
    }
}
