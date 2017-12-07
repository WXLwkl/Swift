//
//  main.swift
//  Swift高级运算符
//
//  Created by yinjia on 15/12/23.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//按位取反运算符~ 对一个操作数的每一位都取反
let initialBits:UInt8 = 0b00001111
let invertedBits = ~initialBits
println(invertedBits)

//按位与运算符&  对两个数进行操作，然后返回一个新的数，这个数的每个位都需要两个输入数的同一位都为1时才为1。


let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // 等于 00111100

//按位或运算符|   比较两个数，然后返回一个新的数，这个数的每一位设置1的条件是两个输入数的同一位不都为0(即任意一个为1，或都为1)。

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // 等于 11111110


//按位异或运算符^  比较两个数，然后返回一个数，这个数的每个位设为1的条件是两个输入数的同一位不同，如果相同就设为0

//左移运算符<< 和 右移运算符>>  会把一个数的所有比特位按以下定义的规则向左或向右移动指定位数。
//按位左移和按位右移的效果相当把一个整数乘于或除于一个因子为2的整数。向左移动一个整型的比特位相当于把这个数乘于2，向右移一位就是除于2。

let shiftBits: UInt8 = 4   // 即二进制的00000100
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001


//溢出运算符
/*
默认情况下，当你往一个整型常量或变量赋于一个它不能承载的大数时，Swift不会让你这么干的，它会报错。

当然，你有意在溢出时对有效位进行截断，你可采用溢出运算，而非错误处理。Swfit为整型计算提供了5个&符号开头的溢出运算符。
溢出加法 &+
溢出减法 &-
溢出乘法 &*
溢出除法 &/
溢出求余 &%
*/








































