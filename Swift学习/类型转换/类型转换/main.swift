//
//  main.swift
//  类型转换
//
//  Created by yinjia on 15/12/19.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation


var a:Int = 123
var b:Float = 23.4
println(Float(a) + b)
println(a + Int(b))

class Student {
    var name:String
    init(name:String)
    {
        self.name = name
    }
    func say()
    {
        println("I am is a student,my name is \(name)")
    }
}

class Teacher {
    var name:String
    init(name:String)
    {
        self.name = name
    }
    func say()
    {
        println("I am is a teacher,my name is \(name)")
    }
}

var persons = [Student(name: "张三"),Teacher(name: "朱自清")]

// is 是判断是否为某个类型 是返回true 不是返回false
// as 是强制转换为某种(引用)类型 (基本类型按上面)

for p in persons
{
//    if p is Student
//    {
//        println("student")
//    }
//    if p is Teacher
//    {
//        println("teacher")
//    }
    
//    if p is Student
//    {
//        let s = p as! Student
//        s.say()
//    }
//    if p is Teacher
//    {
//        let s = p as! Teacher
//        s.say()
//    }

    if let s = p as? Student
    {
        s.say()
    }
    if let s = p as? Teacher
    {
        s.say()
    }
}

//Any 代表任何类型
//AnyObject 任何引用类型

var c:Any = Student(name: "AA")

if let d = c as? Student
{
    d.say()
}

















