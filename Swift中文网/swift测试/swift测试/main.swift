//
//  main.swift
//  swift测试
//
//  Created by yinjia on 15/11/25.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

let minValue = UInt8.max

//println(minValue)

let Student = (name : "小明",age : 12)


 println("姓名是\(Student.name),年龄是\(Student.age)")


for a in 1...10
{
    println(a)

}



var name : String? = "aaa"

//println(name)

//println(name!)

let b : String! = "An implicitly unwrapped optionsl string"

println(b) //不需要感叹号

if b != nil
{
    println(b)
}


//断言
let age = -3
//assert(age>=0) 可以不输出断言信息
//assert(age >= 0, "A person's age cannot be less than zero")


//计算属性
class Person {
    var name:String = "jack"
    var jLength:Int = 10
    var age:Int{
        get{
            return jLength*2
        }
        set(newAge)
        {
            jLength = newAge/2
        }
    }
}

var p = Person()

println(p.age)


/* 
    类属性(或者叫做类型属性)用class关键字修饰.类属性只能是计算属性.
    类属性就是类似java中static修饰的属性.一个类只有一份,且多个实例对象共享.可直接用类名调用
[java] view plaincopy在CODE上查看代码片派生到我的代码片
*/
class Person7{
    class var name:String{
        return "小林"
    }
}
println(Person7.name)

//属性监视
class Person8{
    var name:String = "小林"{
        willSet{
            println("新值为:\(newValue)")    //newValue新值
        }
        didSet{
            println("旧值为:\(oldValue)")   //oldValue表示旧值
        }
    }
}
var p8 = Person8()
p8.name = "jack"    //这句调用

//类中的方法与函数的一点区别: 方法的第一个参数以后,全是外部参数.名字即为参数名
class Person9{
    func sum(num1:Int , num2:Int){
        println(num1 + num2)
    }
}
var p9 = Person9()
p9.sum(10, num2: 10)  //第一个参数以后, 全是外部参数. 相当于加了#

//方法
func add(n1:Int,n2:Int)->Int
{
    return n1+n2
}
println(add(30, 60))

//类方法. 用class修饰
class Person10{
    class func sum(num1:Int , num2:Int){
        println(num1 + num2)
    }
}
Person10.sum(10, num2: 10)



//下标(附属脚本) 可以定义在 类/结构体/枚举中，进行快速访问
//格式：也可以设定set/get
/*
subscript(index:Int) -> Int{
   get{

   }
   set{

   }
}
*/

struct Person1     //官方很多用结构体
{
    let Length:Int  //结构体在这里可以不初始化
    
    subscript(index:Int) -> Int
        {
        return Length * index
    }
}
var p1 = Person1(Length: 3)

println(p1[3])







