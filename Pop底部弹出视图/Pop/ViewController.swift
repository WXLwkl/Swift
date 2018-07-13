//
//  ViewController.swift
//  Pop
//
//  Created by xingl on 2018/7/12.
//  Copyright © 2018年 xingl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button: UIButton = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
        button.setTitle("点击", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(showPop), for: .touchUpInside)
        self.view.addSubview(button)
        
    }

    @objc func showPop() {
        
        self.presentBottom(TestViewController.self)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

