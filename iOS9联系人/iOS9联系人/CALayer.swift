//
//  CALayer.swift
//  iOS9联系人
//
//  Created by xingl on 16/6/22.
//  Copyright © 2016年 yjpal. All rights reserved.
//


import QuartzCore
import Foundation
import UIKit

extension CALayer {
    var borderUIColor:UIColor{
        set(color){
            self.borderColor = color.cgColor;
        }
        get{
            return UIColor(cgColor:self.borderColor!)
        }
    }
}
/******         OC      ********/

/*
 
 在xib中 写  layer.borderUIColor
 
 对 CALayer 扩展
 
 .h文件
 @property(nonatomic,weak)UIColor *borderUIColor;
 
 
 
 .m文件
 - (void)setBorderUIColor:(UIColor *)borderUIColor {
 self.borderColor = borderUIColor.CGColor;
 }
 - (UIColor *)borderUIColor {
 return [UIColor colorWithCGColor:self.borderColor];
 }
 
 */
