//
//  QRViewController.swift
//  cess
//
//  Created by xingl on 2018/5/23.
//  Copyright © 2018年 xingl. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.navigationItem.title = "扫一扫"
        self.view.backgroundColor = .black
       
        let view = ScanView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        view.tag = 100;
        self.view.addSubview(view)
        
        let rectOfInterest: CGRect = CGRect(x: 0.5 * (1 - 0.7) * self.view.frame.width, y: 0.3 * (self.view.frame.height - 0.7 * self.view.frame.width), width: 0.7 * self.view.frame.width, height: 0.7 * self.view.frame.width)
        
        QRCaptureManager.shared.scan { (preViewLayer, output) in
            preViewLayer.frame = self.view.bounds
            self.view.layer.insertSublayer(preViewLayer, at: 0)
            
            let x = rectOfInterest.origin.y / preViewLayer.frame.height
            let y = rectOfInterest.origin.x / preViewLayer.frame.width
            let width = rectOfInterest.size.height / preViewLayer.frame.height
            let height = rectOfInterest.size.width / preViewLayer.frame.width
            output.rectOfInterest = CGRect(x: x, y: y, width: width, height: height)
            }//.rectOfInterest(rectOfInterest)
            .completed { (qrValue) in
                
                print(qrValue)
                
                let vc = ViewController()
                vc.title = qrValue
                self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let view: ScanView = self.view.viewWithTag(100) as! ScanView
        view.startScan()
        
    }
}
