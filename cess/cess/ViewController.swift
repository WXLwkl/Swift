//
//  ViewController.swift
//  cess
//
//  Created by xingl on 2018/5/23.
//  Copyright © 2018年 xingl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    lazy var scanLine: UIImageView = {
//        let scanLine = UIImageView()
//        scanLine.frame = CGRect(x: 0, y: 0, width: self.scanPane.bounds.width, height: 3)
//        scanLine.image = UIImage(named: "QRCode_ScanLine")
//        return scanLine;
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        let button: UIButton = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
        button.setTitle("点击", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    
//    fileprivate func startScan() {
//
//        scanLine.layer.add(scanAnimation(), forKey: "scan")
//        guard let scanSession = scanSession else { return }
//        if !scanSession.isRunning {
//            scanSession.startRunning()
//        }
//    }
//
//    private func scanAnimation() -> CABasicAnimation {
//        let startPoint = CGPoint(x: scanLine.center.x, y: 1)
//        let endPoint = CGPoint(x: scanLine.center.x, y: scanPane.bounds.height - 2)
//
//        let translation = CABasicAnimation(keyPath: "position")
//        translation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//        translation.fromValue = NSValue(cgPoint: startPoint)
//        translation.toValue = NSValue(cgPoint: endPoint)
//        translation.duration = scanAnimationDuration
//        translation.repeatCount = MAXFLOAT
//        translation.autoreverses = true
//        return translation
//    }
//
    
    @objc func nextVC() {
        let vc = QRViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

