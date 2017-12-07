//
//  main.swift
//  结构计算属性
//
//  Created by yinjia on 15/11/22.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

struct Juxing{
    var x = 0
    var y = 0
    var width = 1
    var height = 1
    
    var center:Int{  //计算属性的值是不固定的,因此不能用let修饰,只能用var
        //计算属性 可以没有set 但是必须有get
        get
        {
            return x+width/2
        }
        set
        {
            x = newValue - width/2
        }
    }
}

//var jx = Juxing()
var jx = Juxing(x: 10, y: 20, width: 200, height: 100)
print("x=\(jx.x),y=\(jx.y),width=\(jx.width),height=\(jx.height),center=\(jx.center)")

jx.center = 200
print(jx.x)
