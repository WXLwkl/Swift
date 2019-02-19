//
//  TestViewController.swift
//  Pop
//
//  Created by xingl on 2018/7/12.
//  Copyright © 2018年 xingl. All rights reserved.
//

import UIKit

class TestViewController: PresentBottomVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let bview = UIView(frame: CGRect(x: 0, y: 290, width: 300, height: 8))
        bview.backgroundColor = .red
        view.addSubview(bview)
        
    }

    override var controllerHeight: CGFloat? {
        return 300;
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self .dismiss(animated: true, completion: nil)
    }
}
