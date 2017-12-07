//
//  MyCustomView.swift
//  SwiftDemo
//
//  Created by xingl on 2017/3/27.
//  Copyright © 2017年 yjpal. All rights reserved.
//

import UIKit

@IBDesignable

class MyCustomView: UIView {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBInspectable var title: String = "" {
        didSet {
            nameLabel.text = title
        }
    }
    
    weak var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    
    
    // load view from xib
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    func setupSubviews() {
        view = loadViewFromNib()
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        
//        ageTextField.rightViewMode = .always
//        let labelMaker:()-> UIView = {
//            let precentLabel = UILabel();
//            precentLabel.text = "岁";
//            return precentLabel
//        }
//        ageTextField.rightView = labelMaker()
    }
    // reset subview's frame
    override func layoutSubviews() {
        view.frame = bounds
//        let precentRect = CGRect(x: 0, y: 0, width: 20, height: bounds.size.height)
//        ageTextField.rightView?.bounds = precentRect
//
    }
    
    

}
