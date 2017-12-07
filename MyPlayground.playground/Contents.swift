//: Playground - noun: a place where people can play

import UIKit

import PlaygroundSupport

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        
        self.view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        button.center = self.view.center
        button.setTitle("click me!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(ViewController.click(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        
        let maskPath: UIBezierPath = UIBezierPath(roundedRect: button.bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer: CAShapeLayer = CAShapeLayer()
        
        
        maskLayer.path = maskPath.cgPath
        
        button.layer.mask = maskLayer
        
    }
    @objc func click(_ item: UIButton) {
        if view.backgroundColor == .yellow {
            view.backgroundColor = .cyan
        } else {
            view.backgroundColor = .yellow
        }
    }
}

let viewConroller = ViewController()
PlaygroundPage.current.liveView = viewConroller.view
