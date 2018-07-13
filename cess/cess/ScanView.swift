//
//  ScanView.swift
//  QRDemo
//
//  Created by xingl on 2018/5/21.
//  Copyright © 2018年 xingl. All rights reserved.
//

import UIKit

class ScanView: UIView {

    var borderColor = UIColor()
    var cornerColor = UIColor()
    
    var cornerWidth: CGFloat = 0.0
    
    
    private var scanBorderW: CGFloat = 0.0
    private var scanBorderX: CGFloat = 0.0
    private var scanBorderY: CGFloat = 0.0
    
    
    lazy var lineView: UIImageView = {
        let contentView = UIImageView(image: UIImage(named: "scan_line"))
//        contentView.contentMode = .scaleAspectFit
        return contentView
    }()
    
    
    
    let cover = UIView()
    let refrshView: UIActivityIndicatorView? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        initialization()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialization()
    }

    func initialization() {
        scanBorderW = 0.7 * self.frame.width
        scanBorderX = 0.5 * (1 - 0.7) * self.frame.width
        scanBorderY = 0.3 * (self.frame.height - scanBorderW)
        
        borderColor = .red
        cornerColor = .blue
        cornerWidth = 5.0
        
    }

    func setupView() {
        
        lineView.frame = CGRect(x: scanBorderX + 5, y: scanBorderY+2, width: scanBorderW - 10, height: 3)
        self.addSubview(lineView)
        
        self.cover.frame = CGRect(x: scanBorderX, y: scanBorderY, width: scanBorderW, height: scanBorderW)
        self.cover.backgroundColor = .white
        self.addSubview(self.cover)
        
        
        let refrshView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        refrshView.color = .red
        refrshView.startAnimating()
        refrshView.center = CGPoint(x: scanBorderW / 2.0, y: scanBorderW / 2.0)
        self.cover.addSubview(refrshView)
    }
    func startScan() {
        self.cover.removeFromSuperview()
        lineView.layer.add(scanAnimation(), forKey: "scan")
    }
    func stopScan() {
        lineView.layer.removeAllAnimations()
    }
    
    private func scanAnimation() -> CABasicAnimation {
        let startPoint = CGPoint(x: self.cover.center.x, y: scanBorderY + 2)
        let endPoint = CGPoint(x: self.cover.center.x, y: scanBorderY + scanBorderW - 7)
        
        let translation = CABasicAnimation(keyPath: "position")
        translation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        translation.fromValue = NSValue(cgPoint: startPoint)
        translation.toValue = NSValue(cgPoint: endPoint)
        translation.duration = 2.0
        translation.repeatCount = MAXFLOAT
        translation.autoreverses = true
        return translation
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        let borderW = scanBorderW
        let borderH = borderW
        let borderX = scanBorderX
        let borderY = scanBorderY
        let borderLineW: CGFloat = 1
        
        let context = UIGraphicsGetCurrentContext()
        // 非扫码区域半透明
        // 设置非识别区域颜色
        context?.setFillColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        // 扫码区域上面填充
        var subRect = CGRect(x: 0, y: 0, width: rect.width, height: borderY)
        context?.fill(subRect)
        
        // 扫码区域左边填充
        subRect = CGRect(x: 0, y: borderY, width: borderX, height: borderH)
        context?.fill(subRect)
        
        // 扫码区域右边填充
        subRect = CGRect(x: borderX + borderW, y: borderY, width: borderX, height: borderH)
        context?.fill(subRect)

        // 扫码区域下面
        subRect = CGRect(x: 0, y: borderY + borderH, width: rect.width, height: rect.height - borderY - borderH)
        context?.fill(subRect)
        // 执行绘画
        context?.strokePath()
        
        // 中间正方形区域
        if #available(iOS 10.0, *) {
            context?.setStrokeColor(UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1).cgColor)
        } else {
            // Fallback on earlier versions
            context?.setStrokeColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor)
        }
        context?.setLineWidth(borderLineW)
        context?.addRect(CGRect(x: borderX, y: borderY, width: borderW, height: borderH))
        context?.strokePath()
        
        /// 绘制4个角
        let outsideExcess: CGFloat = 0.5 * (self.cornerWidth - borderLineW)
        let cornerLenght: CGFloat = 20
        
        if #available(iOS 10.0, *) {
            context?.setStrokeColor(UIColor(displayP3Red: 0.11, green: 0.659, blue: 0.498, alpha: 1).cgColor)
        } else {
            context?.setStrokeColor(UIColor(red: 0.11, green: 0.659, blue: 0.498, alpha: 1).cgColor)
        }
        context?.setLineWidth(self.cornerWidth)
        
        
        // 左上角
        context?.move(to: CGPoint(x: borderX + cornerLenght - outsideExcess, y: borderY - outsideExcess))
        context?.addLine(to: CGPoint(x: borderX - outsideExcess, y: borderY - outsideExcess))
        context?.addLine(to: CGPoint(x: borderX - outsideExcess, y: borderY + cornerLenght - outsideExcess))
        
        // 左下角
        context?.move(to: CGPoint(x: borderX - outsideExcess, y: borderY + borderH - cornerLenght + outsideExcess))
        context?.addLine(to: CGPoint(x: borderX - outsideExcess, y: borderY + borderH + outsideExcess))
        context?.addLine(to: CGPoint(x: borderX + cornerLenght - outsideExcess, y: borderY + borderH + outsideExcess))
        
        // 右下角
        context?.move(to: CGPoint(x: borderX + borderW - cornerLenght + outsideExcess, y: borderY + borderH + outsideExcess))
        context?.addLine(to: CGPoint(x: borderX + borderW + outsideExcess, y: borderY + borderH + outsideExcess))
        context?.addLine(to: CGPoint(x: borderX + borderW + outsideExcess, y: borderY + borderH - cornerLenght + outsideExcess))
        
        // 右上角
        context?.move(to: CGPoint(x: borderX + borderW + outsideExcess, y: borderY + cornerLenght - outsideExcess))
        context?.addLine(to: CGPoint(x: borderX + borderW + outsideExcess, y: borderY - outsideExcess))
        context?.addLine(to: CGPoint(x: borderX + borderW - cornerLenght + outsideExcess, y: borderY - outsideExcess))
        
        context?.strokePath()
        
//        // 设置空白区域
//        UIColor.black.withAlphaComponent(0.3).setFill()
//        UIRectFill(rect)
//
//        // 获取上下文，并设置混合模式
//        let context = UIGraphicsGetCurrentContext()
//        context!.setBlendMode(.destinationOut)
//
//        // 设置空白区
//        let bezierPath = UIBezierPath(rect: CGRect(x: borderX + 0.5 * borderLineW, y: borderY + 0.5 * borderLineW, width: borderW - borderLineW, height: borderH - borderLineW))
//        bezierPath.fill()
//
//        // 执行混合模式
//        context?.setBlendMode(.normal)
//
//        // 边框设置
//        let borderPath = UIBezierPath(rect: CGRect(x: borderX, y: borderY, width: borderW, height: borderH))
//        borderPath.lineCapStyle = .butt
//        borderPath.lineWidth = borderLineW
//        self.borderColor.set()
//        borderPath.stroke()
//
//        // 4个角
//        let cornerLenght: CGFloat = 20
//        let cornerPath = UIBezierPath()
//        cornerPath.lineWidth = self.cornerWidth
//        self.cornerColor.set()
//
//        let outsideExcess: CGFloat = 0.5 * (self.cornerWidth + borderLineW)
//
//
//        // 左上
//        cornerPath.move(to: CGPoint(x: borderX + cornerLenght - outsideExcess, y: borderY - outsideExcess))
//        cornerPath.addLine(to: CGPoint(x: borderX - outsideExcess, y: borderY - outsideExcess))
//        cornerPath.addLine(to: CGPoint(x: borderX - outsideExcess, y: borderY + cornerLenght - outsideExcess))
//        // 左下
//        cornerPath.move(to: CGPoint(x: borderX - outsideExcess, y: borderY + borderH - cornerLenght + outsideExcess))
//        cornerPath.addLine(to: CGPoint(x: borderX - outsideExcess, y: borderY + borderH + outsideExcess))
//        cornerPath.addLine(to: CGPoint(x: borderX + cornerLenght - outsideExcess, y: borderY + borderH + outsideExcess))
//        // 右下
//        cornerPath.move(to: CGPoint(x: borderX + borderW - cornerLenght + outsideExcess, y: borderY + borderH + outsideExcess))
//        cornerPath.addLine(to: CGPoint(x: borderX + borderW + outsideExcess, y: borderY + borderH + outsideExcess))
//        cornerPath.addLine(to: CGPoint(x: borderX + borderW + outsideExcess, y: borderY + borderH - cornerLenght + outsideExcess))
//        // 右上
//        cornerPath.move(to: CGPoint(x: borderX + borderW + outsideExcess, y: borderY + cornerLenght - outsideExcess))
//        cornerPath.addLine(to: CGPoint(x: borderX + borderW + outsideExcess, y: borderY - outsideExcess))
//        cornerPath.addLine(to: CGPoint(x: borderX + borderW - cornerLenght + outsideExcess, y: borderY - outsideExcess))
//
//        cornerPath.stroke()
        
    }
}
