//
//  Color.swift
//  CCCCCCCC
//
//  Created by xingl on 16/5/12.
//  Copyright © 2016年 yjpal. All rights reserved.
//

import UIKit

class Color: NSObject {
       
     func log() {
            print("这是Swift的方法")
        }
     func imageWithColor(_ color : UIColor) -> UIImage {
        
        let rect : CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        
        context?.fill(rect)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return img!
        
    }
}

