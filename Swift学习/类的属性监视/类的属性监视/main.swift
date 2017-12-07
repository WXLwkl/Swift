//
//  main.swift
//  类的属性监视
//
//  Created by yinjia on 15/12/5.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/*        
//结构体
struct Student {
    var name = ""
    var age :Int = 1  //必须显示的定义数据类型
    {
        willSet
        {
            if newValue < 1 || newValue > 100
            {
                println("无效的年龄!")
            }
        }
        didSet
        {
            if age < 1 || age > 100
            {
                age = 1
            }
        }
    }
}

var zs = Student()
zs.age = 120

println(zs.age)
*/

//类
class Student {
    var name = ""
    var age :Int = 1  //必须显示的定义数据类型
        {
        willSet
        {
            if newValue < 1 || newValue > 100
            {
                println("无效的年龄!")
            }
        }
        didSet
        {
            if age < 1 || age > 100
            {
                age = oldValue
            }
        }
    }
}

var zs = Student()
zs.age = -2

println(zs.age)




