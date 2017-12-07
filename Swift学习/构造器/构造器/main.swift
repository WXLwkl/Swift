//
//  main.swift
//  构造器
//
//  Created by yinjia on 15/12/6.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//构造器完成初始化工作,


//结构体和枚举都是值类型.默认情况下,值类型的属性不能从它的内部实例方法修改。


//结构可以不指定具体值,只声明数据类型,在实例化对象的时候可以在括号里初始化
//类必须声明时就写好值,或者显式调用init方法.



/*
构造过程是为了使用某个类,结构或者枚举类型的实例而进行的准备过程.
 这个过程包含了为了实例中的每个属性设置初始值和为其执行必要的准备和初始化任务.
  无论是类或者结构活枚举都必须有一个活多个构造的方法,
    对于结构这种值类型的如果没有,系统会提供一个.
    对于类就不行了.
       1.采用默认构造的方法 (在后面写值)

*/
struct Student {
    var name:String
    var age:Int
//    init(name:String,age:Int)
//    {
//        self.name = name
//        self.age = age
//    }
    
    init()
    {
        name = ""
        age = 0
    }
}
//var a = Student(name: "小林", age: 24)
var a = Student() //调用了这个结构的init()

class Teacher {
    var name:String = ""
    var age:Int = 0
   
}
var t = Teacher()  //调用了这个类的init()


/***************   使用    ************************/
struct Student1 {
    var name:String
    var age:UInt8
    
    static var c:Int = 0
/*
    init(fromName name:String,fromeAge age:UInt8) //fromName、fromeAge 是外部参数名称   name、age 是内部参数名称
    {
        self.name = name
        self.age = age
    }
   */

    func count()->Int
    {
        return Student1.c
    }
    
    init(_ name:String,_ age:UInt8) //外部参数行可以省略的 (_和参数之间加空格)  此方法不建议使用
    {
        self.name = name
        self.age = age
        Student1.c++
    }
    
}

//var a1 = Student1(fromName: "小林", fromeAge: 25)
var a1 = Student1("逍遥郎",25)


print("name = \(a1.name),age = \(a1.age)")

//对于类是一样的

print(a1.count())

var a2 = Student1("",3)
print(a1.count())
print(a2.count())





