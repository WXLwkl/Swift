//
//  main.swift
//  Swift闭包
//
//  Created by yinjia on 15/11/30.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//func backwards(s1: String, s2: String) -> Bool {
//    return s1 > s2
//}
//var reversed = sort(names, backwards)


//闭包表达式语法
/*
闭包表达式语法有如下一般形式：
    { (parameters) -> returnType in
        statements
}
*/

//Trailing 闭包
/*
如果您需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用 trailing 闭包来增强函数的可读性。
Trailing 闭包是一个书写在函数括号之外(之后)的闭包表达式，函数支持将其作为最后一个参数调用。
*/
func someFunctionThatTakesAClosure(closure: () -> ()) {
    // 函数体部分
}
// 以下是不使用 trailing 闭包进行函数调用
someFunctionThatTakesAClosure({
    // 闭包主体部分
})
// 以下是使用 trailing 闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
//map 在数组中为每一个元素调用了闭包表达式
let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

println(strings)


//下例为一个叫做 makeIncrementor 的函数，其包含了一个叫做 incrementor 嵌套函数。 嵌套函数 incrementor 从上下文中捕获了两个值，runningTotal 和 amount。 之后 makeIncrementor 将 incrementor 作为闭包返回。 每次调用 incrementor 时，其会以 amount 作为增量增加 runningTotal 的值。
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
//makeIncrementor 返回类型为 () -> Int。 这意味着其返回的是一个函数，而不是一个简单类型值。 该函数在每次调用时不接受参数只返回一个 Int 类型的值。
let incrementByTen = makeIncrementor(forIncrement: 10)

println(incrementByTen())
println(incrementByTen())
println(incrementByTen())



