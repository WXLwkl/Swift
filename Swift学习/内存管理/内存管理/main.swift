//
//  main.swift
//  内存管理
//
//  Created by yinjia on 15/12/9.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/*
        对于循环引用,如果是可选类型,可以使用weak
                   如果是指定类型,可以使用unowned
*/


/*
class Person {
    var name: String
    var house: House?
    init(name: String)
    {
        self.name = name
        println("\(name)的空间被申请了")
    }
    deinit  //反初始化 释放
    {
        println("\(name)的空间被释放了")
    }
}
//var p1: Person?
//var p2: Person?
//var p3: Person?
//
//p1 = Person(name: "张三")
//p2 = p1
//p3 = p1
//
//p1 = nil
//p2 = nil
//p3 = nil

class House {
    var name: String
    weak var person:Person?  //防止循环引用
    init(name: String)
    {
        self.name = name
        println("\(name)的空间被申请了")
    }
    deinit  //反初始化 释放
    {
        println("\(name)的空间被释放了")
    }
}

var p:Person?
var h:House?
p = Person(name: "张三")
h = House(name: "别墅")

p?.house = h
h?.person = p

p = nil
h = nil

*/


class Person {
    var name: String
    var house: House?
    init(name: String)
    {
        self.name = name
        println("\(name)的空间被申请了")
    }
    deinit  //反初始化 释放
    {
        println("\(name)的空间被释放了")
    }
}

class House {
    var name: String
    unowned var person:Person  //unowned 解决循环引用
    init(name: String,person:Person)
    {
        self.name = name
        self.person = person
        println("\(name)的空间被申请了")
    }
    deinit  //反初始化 释放
    {
        println("\(name)的空间被释放了")
    }
}
var p: Person?
p = Person(name: "张三")
p?.house = House(name: "别墅", person: p!)
p = nil








