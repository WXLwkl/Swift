//
//  main.swift
//  协议
//
//  Created by yinjia on 15/12/20.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation


//Protocol(协议) 用于统一方法和属性的名称,而不实现任何功能.协议能够被类,枚举,结构体 实现,满足协议要求的类,枚举,结构体被称为协议的遵守者.

// 语法  属性 方法  是类型 继承 委托 (代理)模式

protocol Song
{
//    var vol:Int
//    {
//        set
//        get
//    }
    
    func song()
    
}

protocol Say:Song
{
    func say()
}


class Student:Say {
    var name:String = ""
    var age:Int = 1
//    var vol = 0
    func song() {
        println("student is songing")
    }
    func say() {
        println("ss is saying")
    }
}

//var s = Student()
////s.vol = 12
//s.song()

//协议可以作为一个数据类型类使用,对它赋值必须是实现这个协议的类

var s:Song?
s = Student()
s!.song()

//已经有的类可以实现协议,用扩展来实现

extension String:Song
{
    func song() {
        println("123 is songing")
    }
}
var str:Song?
str = "123"
str!.song()





