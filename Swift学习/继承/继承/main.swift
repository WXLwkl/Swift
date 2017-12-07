//
//  main.swift
//  继承
//
//  Created by yinjia on 15/12/9.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/*
一个类继承另一个类,如果没有构造器,它会继承父类的构造器;如果有构造器,那么就不能在继承父类的构造器了,而且子类的指定构造器必须去调用父类的指定构造器
*/


/* final */class Person {  //final 最终类,不能被继承 不想被继承 可以加final
    var name: String
    var age: Int
    init(byName name: String,byAge age: Int)  //init的方法不能用final 构造器不能用final
    {
        self.name = name
        self.age = age
    }
    convenience init()
    {
        self.init(byName:"AA",byAge:1)
    }
    final func say()  //final修饰方法,表示这个方法不能被重写
    {
        print("name = \(name),age = \(age)")
    }
}

class Student: Person {
    var number: Int
    init(byNumber number: Int)
    {
        //必须  先初始化自己的数据,再条用父类的初始化 (如果有自己的数据)
        self.number = number
        super.init(byName: "no name", byAge: 1)
    }
    override init(byName name: String, byAge age: Int) {
        self.number = 1
        super.init(byName: name, byAge: age)
    }
    init(byName name: String,byAge age: Int,byNumber number: Int)
    {
       self.number = number
        super.init(byName: name,byAge:age)
    }
    override func say()  //override重写
    {
         print("name=\(name),age=\(age),number=\(number)")
    }
}

var s = Student(byName: "小明", byAge: 23, byNumber: 1)
s.say()


//面向对象的特性之一 多态
var s1:Person
s = Student(byName: "DD", byAge: 24, byNumber: 2)
s.say()

s1 = Person(byName: "CC", byAge: 20)
s1.say()


















