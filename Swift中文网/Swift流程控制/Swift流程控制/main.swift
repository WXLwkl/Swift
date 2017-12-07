//
//  main.swift
//  Swift流程控制
//
//  Created by yinjia on 15/11/27.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/*************  for  *************************/

//如果不需要范围的值，可以用下划线替代变量名来忽略这些值:
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
    println("---\(base)")
}
println("\(base) to the power of \(power) is \(answer)")


//使用for-in循环来迭代出array中的每一个项：
let names = ["a","b","c"]
for name in names
{
    println("Hello,\(name)")
}

//当迭代字典时里面的每一个项都以（key,value）元组的形式来返回，你可以在for-in的循环体中分解 (key, value) 元组的成员，把成员作为显性命名的常量来使用。下面例子，字典的key被分解为animalName的常量，字典的值被分解名为legCount的常量：
let numberOfLegs = ["spider":8,"ant":6,"cat":4]

for (animalName,legCount) in numberOfLegs
{
    println("\(animalName)s have \(legCount) legs")
}

//for-in循环还能迭代字符串中的Character（字符）：
for character in "hello"
{
    println(character)
}

//Swift还支持传统C语言按条件递增的for循环
for var index = 0;index < 3;index++
{
    println("index is \(index)")
}

/***************** while  **************************/

/*
这是常见的while形式：
while <condition> {
     <statements>
}
*/
var a = 1
while a < 5 {
    a++
    println(a)
}
/*
下面是do-while的常见形式:
do {
<statements>
} while <condition>
*/

do {
    a+=2
 println(a)
} while a < 10

println("----\(a)")

/***************  switch  ***************************/
/*
switch比较一个值对应的一个或者多个相同形式的值：
switch some value to consider {
     case value 1:
     respond to value 1
     case value 2, value 3:
     respond to value 2 or 3
     default:
     otherwise, do something else
}
*/
let someCharacter:Character = "e"
switch someCharacter {
    case "a","e","i","o","u":
    println("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
     println("\(someCharacter) is a consonant")
default:
    println("\(someCharacter) is not a vowel or a consonant")
}


let cc = 51
switch cc {
case 0:
    println(0)
case 1...3:
    println("1...3")
case 4...6:
    println("4...6")
default:
    println("--")
}

/*****  元组  ******/
let somePoint = (0, 1)
switch somePoint {
case (0, 0):
    println("(0, 0) is at the origin")
case (_, 0):
    println("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    println("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    println("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    println("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}


let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis with an x value of \(x)")
case (0, let y):
    println("on the y-axis with a y value of \(y)")
case let (x, y):
    println("somewhere else at (\(x), \(y))")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    println("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    println("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    println("(\(x), \(y)) is just some arbitrary point")
}

/*
Control Transfer Statements - 控制转移语句

控制转移语句能改变已经执行代码的顺序，能使代码跳转到别的部分。Swift有四个句子：
continue
break
fallthrough
return

*/



//switch有一个字符值，并且判断四种语言之一中是否有数字符号。一个简单的switch中包含了多个值：
let numberSymbol: Character = "三"
// Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    println("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    println("An integer value could not be found for \(numberSymbol).")
}



