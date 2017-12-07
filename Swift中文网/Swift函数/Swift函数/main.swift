//
//  main.swift
//  Swift函数
//
//  Created by yinjia on 15/11/27.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//无参数 无返回值
func a() {
    print("hello")
}
a()
//有一个参数 无返回值
func b(a:Int) {
    print(a)
}
b(3)

func c(name:String)->String {
    let greeting = "hello," + name + "!"
    return greeting
}
//println(c("wang"))
var cc = c("wang")
print(cc)

//两个参数 一个返回值
func d(a:Int,b:Int)->Int {
    let c = a+b
    return c
}
var dd = d(3,b: 4)
print(dd)

//多返回值  可以使用一个元组类型作为函数的返回类型返回一个有多个值组成的一个复合作为返回值。

//下面的例子定义了一个名为count函数，用它计来算字符串中基于标准的美式英语中设定使用的元音、辅音以及字符的数量：
func count(string:String)->(vowels:Int,consonants:Int,others:Int)
{
    var vowels = 0,consonants = 0,others = 0
    for character in string.characters
    {
        switch String(character).lowercaseString
        {
            case "a","e","i","o","u":
            vowels++
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            consonants++
        default:
            others++
        }
    }
    
    return (vowels,consonants,others)
}

let total = count("some arbitrary string!")
print("\(total.vowels) vowels and \(total.consonants) consonants")


//外部参数名(别名)  有时当你调用一个函数将每个参数进行命名是非常有用的，以表明你传递给函数的每个参数的目的。

func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2
}
//调用这个函数，你传递给函数的三个字符串的目的就不是很清楚了
join("hello", s2: "world", joiner: ", ")
// returns "hello, world"

//为了使这些字符串值的目的更为清晰,为每个join函数参数定义外部参数名称:
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}
join(string: "hello", toString: "world", withJoiner: ", ")
// returns "hello, world"


/*
外部参数名称速记

如果你想为一个函数参数提供一个外部参数名，然而本地参数名已经使用了一个合适的名称了，你不需要为该参数写相同的两次名称。取而代之的是，写一次名字，并用一个hash符号（＃）作为名称的前缀。这告诉Swift使用该名称同时作为本地参数名称和外部参数名称
*/
func containsCharacter(,#string: String,, #characterToFind: Character) -> Bool {
    for character in string.characters {
        if character == characterToFind { return true }
    }
    return false
}
let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")
// containsAVee equals true, because "aardvark" contains a "v"



//参数的默认值
func abc(string s1:String,toString s2:String,withJoiner joiner:String = " ")->String
{
    return s1 + joiner + s2
}

var ss = abc(string: "hello", toString: "world", withJoiner: "+")
print(ss)
var sss = abc(string: "hello", toString: "world")
print(sss)


//输入输出参数
func change(inout a:Int,inout b:Int)
{
    let temp = a
    a = b
    b = temp
}
var someInt = 3
var anotherInt = 5
change(&someInt, b: &anotherInt)
print("Now someInt is \(someInt),anotherInt is \(anotherInt).")


//使用函数类型   在swift中您可以像任何其他类型一样的使用函数类型。例如，你可以定义一个常量或变量为一个函数类型，并指定适当的函数给该变量
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

var mathFunction:(Int,Int)->Int = addTwoInts
//可以解读为："定义一个名为mathFunction变量，该变量的类型为'一个函数，它接受两个int值，并返回一个int值。'设置这个新的变量来引用名为addTwoInts功能。"
print("Result:\(mathFunction(3,4))")

//与其他类型一样,你可以把它迅速推断成函数类型当你为常量或变量分配一个函数时:
let vv = addTwoInts
print(vv(5,b: 6))

//函数类型的参数
//可以使用一个函数类型，如(Int, Int)->Int作为另一个函数的参数类型。这使你预留了一个函数的某些方面的函数实现，让调用者提供的函数时被调用。
func printMathResult(mathFounction:(Int,Int)->Int,a:Int,b:Int) {
    print("result:\(mathFounction(a,b))")
}
printMathResult(addTwoInts, a: 3, b: 5)



/*

//函数类型的返回值  使用一个函数类型作为另一个函数的返回类型。返回的函数-（>）即你的返回箭头后，立即写一个完整的函数类型就做到这一点。

func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

//这里有一个chooseStepFunction函数，它的返回类型是"函数类型(Int) -> Int"。chooseStepFunction返回一个基于布尔参数的stepBackward或stepForward函数类型:
func chooseStepFunction(backwards: Bool) -> (Int) ->Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
//前面的例子可以判断正负的步骤决定是否需要移动一个名为使得currentValue变量逐步接近零。currentValue初始值是3，这意味着当前值>0，则返回true，chooseStepFunction返回stepBackward函数。返回函数的引用存储在一个称为moveNearerToZero常量里。
println("Counting to zero")
while currentValue != 0 {
    println("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
    
}

*/



//嵌套函数
//迄今为止所有你在本章中遇到函数都是全局函数，在全局范围内定义。其实你还可以在其他函数中定义函数，被称为嵌套函数。 嵌套函数默认对外界是隐藏的，但仍然可以调用和使用其内部的函数。内部函数也可以返回一个嵌套函数，允许在嵌套函数内的另一个范围内使用。

//重写上面的chooseStepFunction例子使用并返回嵌套函数：
func reChooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backwards ? stepBackward : stepForward
}
var reCurrentValue = -4
let reMoveNearerToZero = reChooseStepFunction(reCurrentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while reCurrentValue != 0 {
    print("\(reCurrentValue)... ")
    reCurrentValue = reMoveNearerToZero(reCurrentValue)
}
print("zero!")

/*   报错了
let xx = stepBackward(5)
println("-----\(xx)")
*/
