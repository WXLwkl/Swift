//
//  PresentBottomController.swift
//  Pop
//
//  Created by xingl on 2018/7/12.
//  Copyright © 2018年 xingl. All rights reserved.
//

import UIKit

class PresentBottomController: UIPresentationController {

    lazy var blackView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame;
        }
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    public var controllerHeight: CGFloat // controller高度
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        if case let vc as PresentBottomVC = presentedViewController {
            controllerHeight = vc.controllerHeight ?? UIScreen.main.bounds.height
        } else {
            controllerHeight = UIScreen.main.bounds.height
        }
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func presentationTransitionWillBegin() {
        blackView.alpha = 0;
        containerView?.addSubview(blackView)
        UIView.animate(withDuration: 0.25) {
            self.blackView.alpha = 1
        }
    }
    override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.25) {
            self.blackView.alpha = 0
        }
    }
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            blackView.removeFromSuperview()
        }
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: UIScreen.main.bounds.height - controllerHeight, width: UIScreen.main.bounds.width, height: controllerHeight)
    }
}

/// a base class of vc to write bottom view
public class PresentBottomVC: UIViewController {
    public var controllerHeight: CGFloat? {
        get {
            return self.controllerHeight
        }
    }
}

extension UIViewController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let present = PresentBottomController(presentedViewController: presented, presenting: presenting)
        return present
        
    }
    
    public func presentBottom(_ vc: PresentBottomVC.Type) {
        let controller = vc.init()
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self
        self.present(controller, animated: true, completion: nil)
    }
}
