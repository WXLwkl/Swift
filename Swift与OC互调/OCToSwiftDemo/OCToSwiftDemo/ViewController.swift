//
//  ViewController.swift
//  OCToSwiftDemo
//
//  Created by xingl on 16/5/15.
//  Copyright © 2016年 yjpal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnVC = UIButton(frame: CGRect(origin: CGPoint(x: 20.0, y: 200.0), size: CGSize(width: 100, height: 50)))
        btnVC.backgroundColor = UIColor.green
        btnVC.setTitle("下一页", for: UIControlState())
        btnVC.setTitleColor(UIColor.red, for: UIControlState())
        btnVC.addTarget(self, action: #selector(ViewController.btnVCClick(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnVC)
        
        
        let imgV = UIImageView(frame: CGRect(x: 50, y: 400, width: 50, height: 50))
        
        imgV.image = Color.createImage(with: UIColor.red)
        
        self.view.addSubview(imgV)
        
        
        
        
        
    }
    func btnVCClick(_ seder:UIButton!) {
        
        print("vc")
        
        let a = NextViewController()
        
        self.navigationController?.pushViewController(a, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

