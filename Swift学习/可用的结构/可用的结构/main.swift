//
//  main.swift
//  可用的结构
//
//  Created by yinjia on 15/12/19.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//点的结构  Point NSPoint  CGPointMake函数
//var p = NSPoint(x: 2, y: 3)
var p = CGPointMake(3, 4)
println(p)

//矩形  Rect(左上角坐标和右下角坐标)  NSRect(左上角坐标,宽度和高度)  CGRectMake函数
//var r = NSRect(x: 0, y: 0, width: 100, height: 100)
var r = CGRectMake(0, 0, 100, 100)
println(r)

//范围 Range(start: 1,end: 2)  NSRange(location: 1,length: 2)
//var r = Range(start: 1,end: 2)
var rr = NSRange(location: 1,length: 2)

//大小   NSSize  CGSizeMake(<#width: CGFloat#>, <#height: CGFloat#>)

var size = NSSize(width: 100, height: 50)
var ss = CGSizeMake(100, 50)
println(ss)















































