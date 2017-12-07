//
//  main.swift
//  属性监视
//
//  Created by yinjia on 15/11/22.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

struct Mypoint
{
    var x:Int = 0
    {
        //将要设置
        willSet //x属性只要变化,就会自动调用这个方法,但初始化时不调用
        {
//            println("你修改了x")
            println(newValue) // newValue 修改后的值
        }
        //已经设置
        didSet
        {
            println(oldValue) // oldValue 修改前的值
        }
    }
    var y = 0 // var 实例的属性
    
    static var c = 0 // static 类型的属性
    func getCount()->Int
    {
        return Mypoint.c
    }
}
var p1 = Mypoint() //初始化
//p1.x = 10

println(Mypoint.c)

