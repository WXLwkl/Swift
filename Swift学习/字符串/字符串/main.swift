//
//  main.swift
//  字符串
//
//  Created by yinjia on 15/12/21.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//isEmpty 是否为空 true 空的 false 非空
//count() countElements() 统计字符串中字符的个数
//字符串相加就是字符串相连 变量型的字符串

/*

var  str:String = "123"

str = str + "11"

println(str)
println(str.isEmpty)
println(count(str))

//判断字符串是否相等 ==
println(str == "12311")

//大小写
var str1:String = "abcDEFG"
str1 = str1.uppercaseString
println(str1)

//是否以什么开头
println(str1.hasPrefix("abc"))

//提取子字符串
//var s = str1.substringFromIndex(str1.startIndex)
//println(s)

str = "123456789"

//var index = str.startIndex
//index = advance(index, 2)  //index后两位
//println(index)
//var a = str.substringFromIndex(index)
//println(a)

var begin = str.startIndex //0
begin = advance(begin, 2)
var end = str.endIndex  //9
end = advance(end, -5)
//var a = str.substringToIndex(end)

var range = Range(start: begin,end: end)
var a = str.substringWithRange(range)
println(a)

*/

var str = "123456789"
//遍历
//for s in str
//{
//    println(s)
//}

//查
//var index = advance(str.startIndex, 2)
//println(str[index])

////删除
//str.removeAll(keepCapacity: true)  //删除后空间是否保留 true保留 false不保留
//println(str)

////插入
//str.insert("K", atIndex: str.startIndex)
//println(str)

//替换
var begin = str.startIndex
var end = str.endIndex
begin = <#T##Collection corresponding to `begin`##Collection#>.index(begin, offsetBy: 3)
var r = (begin ..< end)
str.replaceSubrange(r, with: "kj")
print(str)


print("-----------------------------------------")
//string字符串的长度（不能用lenth了）
print(str.characters.count)







