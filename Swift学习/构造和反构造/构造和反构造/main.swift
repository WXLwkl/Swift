//
//  main.swift
//  构造和反构造
//
//  Created by yinjia on 15/12/7.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/**************  构造器  **********************/

//类必须要初始化
class Student {
    var name:String
    var age:Int
//    init()
//    {
//        name = "AA"
//        age = 1
//    }
    init(byName name:String,byAge age:Int)
    {
        self.name = name
        self.age = age
    }
    
/*
    *便利构造器只能调用指定构造器  不能直接写代码
    */
    convenience init()  //便利的构造器
    {
        self.init(byName:"AA",byAge:1)
    }
}
var a = Student()
println(a.name)

/**************  反构造器  ***********************/


//类必须要初始化
class Student1 {
    var name:String
    var age:Int
    //    init()
    //    {
    //        name = "AA"
    //        age = 1
    //    }
    init(byName name:String,byAge age:Int)
    {
        self.name = name
        self.age = age
    }
    
    /*
    *便利构造器只能调用指定构造器  不能直接写代码
    */
    convenience init()  //便利的构造器
    {
        self.init(byName:"AA",byAge:1)
    }
    
    deinit   //反构造 就是销毁
    {
        println("this is deinit")
    }
}

var s:Student1?
s = Student1(byName: "dd", byAge: 23)
println(s!.name)

s = nil  //必须把s设置成指定类型(就是加 ?)























