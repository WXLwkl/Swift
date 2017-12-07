//
//  main.swift
//  类的属性
//
//  Created by yinjia on 15/11/28.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

struct Mystruct {
    var a:Int = 0
    let b:Int = 0
    
    var c:Int
    {
        get
        {
            return a
        }
        set
        {
            a = newValue * 2
        }
    }
}


class Myclass {
    var a:Int = 0
    let b:Int = 0
    
    var c:Int
        {
        get
        {
            return a 
        }
        set
        {
            a = newValue * 3
        }
    }
}
/*
结构和类的区别
1.结构是值的类型,赋值的时候是copy, 类是引用的类型,赋值的时候是引用
2.结构的常量实例,无论是变量还是常量属性,都是常量型的,不能再赋值了,
类的常量实例,常量属性不能再赋值,但常量的属性仍然可以赋值.
*/

//var s = Mystruct()
//s.a = 1
//s.b = 1
//let c = Myclass()
//c.a = 2
//c.b = 2


var s = Myclass()
s.a = 12
print(s.c)



