//
//  main.swift
//  方法
//
//  Created by yinjia on 15/12/5.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation
/*

class Student {
    var name = "无名氏"
    var age = 1
    
    func say()
    {
        age++
        println("我叫\(name),今年\(age)岁了")
    }
}

var zs = Student()
zs.name = "小林"
zs.age = 24
zs.say()

*/

/*
//对于值类型,他的方法不能修改属性的值,但可以访问属性的值
struct Student {
    var name = "无名氏"
    var age = 1
    
    mutating func say() //mutating变异  想要修改属性的值要使用此关键字
    {
        age++
        println("我叫\(name),今年\(age)岁了")
    }
}

var zs = Student()
zs.name = "小林"
zs.age = 24
zs.say()

*/

/*
//枚举
enum Switch
{
    case off,on
    
    mutating func next() //切换状态
    {
        if self == on
        {
            self = off
        }
        else
        {
            self = on
        }
    }
}

var a = Switch.on
switch a
{
case .off:
    println("关")
case .on:
    println("开")
}
a.next()

switch a
{
case .off:
    println("关")
case .on:
    println("开")
}
a.next()

switch a
{
case .off:
    println("关")
case .on:
    println("开")
}
*/

class Student {
    var name = ""
    var age = 1
    
    func setName(_ name:String) //方法中的参数 如果没有var修饰,就是let型的
    {
        self.name = name //self用于区别是参数的name还是属性name.
    }
    //类类型可以随意修改属性 不用加关键字mutating
    func setName(#name:String,myage age:Int) //myage 方法对外提供的参数名称
    {
        self.name = name
        self.age = age
    }
    func say()
    {
        age += 1
        print("name:\(name),age:\(age)")
    }
}

var s = Student()
s.setName(name: "小林", myage: 22)  //如果想写name: 就加# 显示用外部参数名
s.say()










