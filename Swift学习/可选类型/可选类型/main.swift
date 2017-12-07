//
//  main.swift
//  可选类型
//
//  Created by yinjia on 15/12/11.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

// ?代表可选的类型,它里面可能有东西,也可能没有东西
// !代表的是这个可选类型的变量里面确实有东西了,可以放心使用.

var a:Int?  //可选类型的变量
a = 1

if a != nil
{
    print(a!)  //强制转换
}
//else
//{
//    println("error")
//}

if let b = a  //自诊断.
{
    print(b)
}


class Person {
    var card:Card?
}
class Card {
    var number:UInt16
    init(number:UInt16)
    {
        self.number = number
    }
    func show()
    {
        print("this is \(number)")
    }
}


var p = Person()
var c = Card(number: 1234)
p.card = c
if let n = p.card?.number
{
    print(n)
}
//println(p.card?.show())

p.card?.show()
























