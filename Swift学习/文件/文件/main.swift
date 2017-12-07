//
//  main.swift
//  文件
//
//  Created by yinjia on 15/12/20.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/************  字符串  *********************/
//var str = "王兴林 25"
var str:NSString = "王兴林 25"
var result = str.writeToFile("string.txt", atomically: true, encoding: NSUTF8StringEncoding, error: nil)

if result
{
    println("写入文件成功")
}else{
    println("写入文件失败")
}

/*************  数组  *****************/
//var arr:NSArray = [1,2,3,4];
var arr:NSArray = NSArray(objects: "1","2","3","4")
var result1 = arr.writeToFile("Array.plist", atomically: true)
if result1
{
    println("写入文件成功")
}else{
    println("写入文件失败")
}

/**************  字典  ***********************/

var dict:NSDictionary = ["1":"zhangsan","2":"lisi"]
var result2 = dict.writeToFile("dict.plist", atomically: true)

if result2
{
    println("写入文件成功")
}else{
    println("写入文件失败")
}

/************** 自定义类型  ***********************/
class Person {
    var name:String = "AA"
    var age:Int32 = 1
}
var p1 = Person()
p1.name = "zhangsan"
p1.age = 22
var p2 = Person()
p2.name = "lisi"
p2.age = 24

var dict1:NSDictionary = ["1":p1,"2":p2]
var result3 = dict1.writeToFile("dict1.plist", atomically: true)

if result3
{
    println("写入文件成功")
}else{
    println("写入文件失败")
}















