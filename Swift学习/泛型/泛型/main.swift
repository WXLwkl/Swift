//
//  main.swift
//  泛型
//
//  Created by yinjia on 15/12/21.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/*
/*
func exchange(inout a:Int,inout b:Int)
{
    var t = a
    a = b
    b = t
}

func exchange(inout a:String,inout b:String)
{
    var t = a
    a = b
    b = t
}
*/
//函数重载
func exchange<T>(inout a:T,inout b:T) //<T> <T,U> 泛型
{
    var t = a
    a = b
    b = t
}

var a = 1
var b = 2
println("a = \(a),b = \(b)")

exchange(&a, &b)   //要取地址

//swap(&a, &b)

println("a = \(a),b = \(b)")

*/

class Stack<T> {          //栈:先进后出  队列:先进先出
    var items = [T]() //字符串[String]() ...
    func push(a:T)
    {
        items.append(a)
    }
    func pop()->T
    {
        return items.removeLast()
    }
    
}

var stack = Stack<Double>()  //创建时 必须在类后写明数据类型
stack.push(1)
stack.push(2)
stack.push(3)

println(stack.pop())
println(stack.pop())
println(stack.pop())
























