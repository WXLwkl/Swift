//
//  main.swift
//  附属脚本
//
//  Created by yinjia on 15/12/5.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//数组
//var arr = [1,2,3,4,5]
//println(arr[0])

//附属脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值
/*
struct Times
{
    var t = 1
    subscript(index:Int)->Int
    {
            get
        {
           return t*index
        }
        set
        {
            println(index)
            t = newValue
        }
    }
}

var a = Times()
println(a[5])
a[4]=23
println(a.t)

*/

/*
var a = 1
var b = 2
println(max(a,b))  //max(a,b) 比大小 返回值为大的
swap(&a, &b) //两个数字交换
println("a=\(a),b=\(b)")

//arc4random() 数据数
println(arc4random()%4)

*/

class Random {
    subscript(index:UInt32)->UInt32
        {
        return arc4random()%index
    }
    subscript(min:UInt32,max:UInt32)->UInt32
        {
            return arc4random()%(max-min)+min
    }
    
    func f(_ n:Int)
    {
        print(n)
    }
    func f(_ n:Int,nn:Int)
    {
        print(n)
    }

}

var a = Random()

a.f(100)
a.f(100, nn: 200)

var c = 0
for i in 1...100
{
//    if a[100] == 0
//    {
//        c++
//    }
    print(a[100,200])
}
//println(c)





