//
//  main.swift
//  类的类型属性和方法
//
//  Created by yinjia on 15/12/5.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/*
//类型的属性是属于当前的类型的,所有的实例是共享它的,
struct Student {
    var name = "" //实例的属性
    var age = 1   //实例的属性
    
    static var count:Int = 0 //类型的属性  通过类型访问
    
    func f() //实例的方法  实例的方法可以访问类型的属性,也可以访问实例的属性
    {
        Student.count++
        println("这是实例的方法")
    }
    
    static func ff() //类型的方法 不能访问实例的属性 可以访问类型的属性
    {
        Student.count++
        println("这是类型的方法")
    }
}

var a = Student() //实例变量a
a.f()
Student.ff()
Student.count++
println(Student.count)
*/


class Student {
    var name = "" //实例的属性
    var age = 1   //实例的属性
    
    class var count:Int //类型的属性必须是计算的属性  通过类型访问
    {
        return 0
    }
    func f() //实例的方法  实例的方法可以访问类型的属性,也可以访问实例的属性
    {
//        Student.count++
        print("这是实例的方法")
    }
    
    class func ff() //类型的方法 不能访问实例的属性 可以访问类型的属性
    {
//        Student.count++
        print("这是类型的方法")
    }
}

var a = Student() //实例变量a

print(Student.count)
Student.ff()









