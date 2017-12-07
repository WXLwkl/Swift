//
//  main.swift
//  类的应用
//
//  Created by yinjia on 15/12/8.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//长方形
class Rectangle { //类必须提供初始值(不建议) ,或者初始化(建议)
    var width:Int
    var height:Int
    init(fromWidth width:Int,fromHeight height:Int)//建议使用带参数的初始化的方法
    {
        self.width = width
        self.height = height
    }
    
    func area()->Int
    {
        return width * height
    }
    
}

//正方形
class Square {
    var side:Int
    init(side:Int)
    {
        self.side = side
    }
    func area()->Int
    {
        return side * side
    }
}

//三角形
class Triangle {
    var bottom:Int
    var height:Int
    init(byBottom bottom:Int,byHeight height:Int)
    {
        self.bottom = bottom
        self.height = height
    }
    func area()->Float
    {
        return Float(bottom) * Float(height) / 2.0  //转换数据类型
    }

}

//园
class Circle {
    var radio:Int
    init(fromRadio radio:Int)
    {
        self.radio = radio
    }
    func area()->Float
    {
        return Float(M_PI) * Float(radio) * Float(radio)
    }
}

//长方形
var r = Rectangle(fromWidth: 100, fromHeight: 50)
println(r.area())

//正方形
var s = Square(side: 100)
println(s.area())

//三角形
var t = Triangle(byBottom: 13, byHeight: 5)
println(t.area())

//园
var c = Circle(fromRadio: 10)
println(c.area())












