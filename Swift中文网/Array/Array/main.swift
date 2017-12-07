//
//  main.swift
//  Array
//
//  Created by yinjia on 15/11/26.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//var arr:[String] = ["a","s"];
var arr = ["1","2"];
print(arr)
print("数组的元素个数是\(arr.count)个")

//使用Boolean型的isEmpty属性，可以快速检查count属性是否为0：
if arr.isEmpty
{
    print("空得")
}
else
{
    print("非空")
}
//往数组的末尾添加一个元素，可以调用数组的append方法：
arr.append("3")
//往数组末尾添加一个元素，也可以使用+=操作符,也可以使用+=操作符把一个类型相同的数组连接到数组后面：
//arr += "4"
arr += ["4","5","6"]
for a in arr
{
    print(a)
}

var firstItem = arr[0]
print("第一个数是\(firstItem)")

arr[0] = "x"
//可以使用下标语法一次性改变指定范围的值，即使将要被替换掉的元素的数量和将要替换成的元素的数量不一样。
arr[2...5] = ["q"]

//数组的迭代访问  可以通过for-in循环来迭代访问整个数组的值
for a in arr
{
    print(a)
}
//如果要获得每个元素的索引及其对应的值，可以使用全局的enumerate方法来迭代使用这个数组。enumerate方法对每个元素都会返回一个由索引值及对应元素值组成的元组。你可以把元组中的成员转为变量或常量来使用：
for (index,value) in arr.enumerated()
{
    print("Item\(index+1):\(value)")
}


//插入一个元素到特定位置，可以调用数组的insert(atIndex:)方法：
arr.insert("3", at: 1)
print(arr)

let mapleSyrup = arr.remove(at: 0) //返回被删除的数
print(mapleSyrup)

//如果想删除数组的最后一个元素，可以使用removeLast方法

let lastItem = arr.removeLast()
print(lastItem)


//数组创建于初始化
var someInts = [Int]()
//var someInts = Int[]()
print("someInts is of type Int[] with \(someInts.count) items")

someInts.append(3)

print(someInts)
//空的数组字面量被写为[]，就是一对不包括任何内容的方括号。
someInts = []  // someInts现在成为了一个空数组，但其类型仍然是Int[]

print(someInts)

//Swift的数组还提供了一个生成若干个重复元素组成的数组的初始化函数。把要添加到新数组里的元素数量（count）和一个合适的默认值(repeatedValue)传参给该初始化函数即可：
//var threeDoubles = Double[](count: 3, repeatedValue: 1.1)
var threeDoubles = [Double](repeating: 1.1, count: 3)
print(threeDoubles)
//得益于Swift的类型推断，在使用这个初始化函数的时候，不必精确说明该数组的类型，因为这能从默认值中推断出来：
var anotherThreeDoubles = Array(repeating: 2.2, count: 3)
print(anotherThreeDoubles)





