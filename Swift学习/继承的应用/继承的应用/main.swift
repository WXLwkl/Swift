//
//  main.swift
//  继承的应用
//
//  Created by yinjia on 15/12/9.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation


class Shape {
    var width: Float
    var height: Float
    init(byWidth width:Float,byHeight height:Float)
    {
        self.width = width
        self.height = height
    }
    func area()->Float
    {
        return width * height
    }
}

//长方形
class Rectangle: Shape {
    
}
var r = Rectangle(byWidth: 100, byHeight: 50)
println(r.area())

//正方形
class Square: Shape {
    init(bySide side:Float)
    {
        super.init(byWidth: side, byHeight: side)
    }
}
var s = Square(bySide: 100)
println(s.area())

//三角形
class Triangle: Shape {
    init(byBottom bottom:Float,byHeight height:Float)
    {
        super.init(byWidth: bottom, byHeight: height)
    }
    override func area() -> Float {
        return super.area()/2.0
    }
}
var t = Triangle(byBottom: 100, byHeight: 50)
println(t.area())

//圆
class Circle: Shape {
    init(byRadio radio:Float)
    {
        super.init(byWidth: radio, byHeight: radio)
    }
    override func area() -> Float {
        return Float(M_PI) * super.area()
    }
}
var c = Circle(byRadio: 10)
println(c.area())


//多态
var shape:Shape
shape = t
println(shape.area())
