//
//  main.swift
//  基础语法
//
//  Created by yinjia on 15/11/26.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error

print(http404Error.1)

print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")


let aaa = "123"
let bbb = aaa.toInt()
//if bbb != nil
//{
//    println("\(aaa) has an integet value of \(bbb!)")
//}else{
//    println("\(aaa) could not be converted to an integer")
//}

//在if语句中写一个可选绑定：
if let actualNumber = aaa.toInt() {
    print("\(aaa) has an integer value of \(actualNumber)")
} else {
    print("\(aaa) could not be converted to an integer")
}

let a = 40
let cc = true
let b = a + (cc ? 50:20)

print(b)

for a in 0...7
{
    print(a)
}


