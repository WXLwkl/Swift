//
//  main.swift
//  var&&inoutDemo
//
//  Created by xingl on 16/5/6.
//  Copyright © 2016年 yinjia. All rights reserved.
//

import Foundation


func handle(var x: Int) {
    x = 2
}
var number = 1
handle(number)

print(number)


func handle1(inout x: Int) {
    x = 2
}

var number1 = 1
handle1(&number1)
print(number1)

