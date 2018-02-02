//
//  WebPictureController.swift
//  CyclePictureView
//
//  Created by wl on 15/11/7.
//  Copyright © 2015年 wl. All rights reserved.
//

import UIKit

class WebPictureController: UIViewController {

    
    @IBOutlet weak var cyclePictureView: CyclePictureView!
    var dataArray: Array? = { () -> NSArray? in
        let path = Bundle.main.path(forResource: "Image.plist", ofType: nil)!
        var array = NSArray(contentsOfFile: path)
        return array
        }() as Array?
    
    var imageURLArray: [String] = []
    var imageDetailArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<dataArray!.count {
            imageURLArray.append(dataArray![i]["image"] as! String)
            imageDetailArray.append(dataArray![i]["title"] as! String)
        }
        
        cyclePictureView.imageURLArray = imageURLArray
        cyclePictureView.imageDetailArray = imageDetailArray
        cyclePictureView.autoScroll = true
        cyclePictureView.placeholderImage = UIImage(named: "302")
        cyclePictureView.timeInterval = 5
        cyclePictureView.pageControlAliment = .rightBottom
        cyclePictureView.detailLableBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
    }
    
    deinit {
        //print("WebPictureController----deinit")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.cyclePictureView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width-100, height: 150)
    }
}
