//
//  ViewController.swift
//  SwiftDemo
//
//  Created by xingl on 2016/10/25.
//  Copyright © 2016年 yjpal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = MyView(frame: CGRect(x: 20, y: 50, width: 60, height: 100))
        
        v.titleLabel.text = "XXXX"
        self.view.addSubview(v)
        v.backgroundColor = .yellow
        
        
//        let view = MyCustomView(frame: CGRect(x: 0, y: 160, width: UIScreen.main.bounds.size.width, height: 50))
//        
//        view.nameLabel.text = "XXXX"
//        self.view.addSubview(view)
//        view.backgroundColor = .yellow
//        
//        
//        print(view.nameTextField.text ?? "无数据")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

