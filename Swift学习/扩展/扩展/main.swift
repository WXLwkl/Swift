//
//  main.swift
//  扩展
//
//  Created by yinjia on 15/12/19.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation


//var a:String = "nihao"

//属性 构造器 方法 下标
//扩展是给已经存在的结构或类添加功能

/**************   添加属性   *************************************/
extension Double
{
    var km:Double
        {
        return self*1000
    }
    var m:Double
        {
        return self
    }
    var cm:Double
        {
        return self/100
    }
    var mm:Double
        {
        return self/1000
    }
}

var len = 12.3.km
println(len)

/**************   添加构造器   *************************************/
struct Point {
    var x:Double
    var y:Double
    init(x:Double,y:Double)
    {
        self.x = x
        self.y = y
    }
}

struct Size {
    var width:Double
    var height:Double
    init(width:Double,height:Double)
    {
        self.width = width
        self.height = height
    }
}

struct Rect {
    var left:Point
    var size:Size
    init(left:Point,size:Size)
    {
        self.left = left
        self.size = size
    }
    func show()
    {
        println("x = \(left.x),y = \(left.y),width = \(size.width),height = \(size.height)")
    }
}

extension Rect
{
    init(center:Point,size:Size)
    {
        let x = center.x - size.width/2
        let y = center.y - size.height/2
        self.init(left:Point(x: x, y: y),size:size)
    }
}

//var r = Rect(left: Point(x: 10, y: 10), size: Size(width: 100, height: 50))
var r = Rect(center: Point(x: 100, y: 100), size: Size(width: 100, height: 50))
r.show()


/**************   添加方法   *************************************/

/*  封装了,在trim.swift中 */

var str:NSString = "  123  "
println("a\(str)b")

//str = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
str = str.trim()
println("a\(str)b")


/**************   添加下标   *************************************/

/*  封装了,在trim.swift中 */

var str1 = "123456789"
println(str1[5])























