//
//  main.swift
//  Dictionary
//
//  Created by yinjia on 15/11/26.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//Swift的字典类型是Dictionary<KeyType, ValueType>，其中KeyType是字典中键的类型，ValueType是字典中值的类型。
//键值对是一个键和一个值的组合。在字典字面量中，每对键值对中的键和值使用冒号分开，键值对之间用逗号分开，用一对方括号将这些键值对包起来：
//[key 1: value 1,  key 2: value 2,  key 3: value 3]

//var airports:Dictionary<String,String> = ["TYO":"Tokyo","DUB":"Dublin"]
//println(airports)

//就像数组一样，如果使用具有相应类型的键和值的字典字面量来对字典进行初始化，你可以不必明确写出这个字典的类型。上面初始化airports的代码可以简写为：
var airports = ["TYO":"Tokyo","DUB":"Dublin"]
print(airports)

//可以使用下标语法向字典中添加新的元素
airports["LHR"] = "London"
for a in airports
{
    print(a)
}

airports["LHR"] = "London Heathrow" //// "LHR"的值被改为"London Heathrow"

print(airports["LHR"]!)

//updateValue(forKey:)函数返回一个值的类型的可选值。例如一个值类型为String的字典，该函数返回值的类型为String?。如果更新前该键的值存在，函数返回值就是该键更新前的值，如果不存在，函数返回值就是nil：
if let oldValue = airports.updateValue("Dublin International", forKey: "DUB")
{
    print("The oldValue for DUB was \(oldValue)")
}
let air = airports["DUB"]
print("------\(air)")

//可以使用下标语法从字典中对一个特定的键取值。因为可能会用到一个没有对应值存在的键，所以字典的下标语法返回的也是该字典值类型的可选值。如果字典中有该键对应的值，下标语法就返回该值，如果不存在，下标语法就返回nil：
if let airportName = airports["DUB"]{
    print("The name of the airport is \(airportName).")
}else{
    print("That airport is not in the airports dictionary.")
}

//也可以使用下标语法把一个键对应的值赋为nil来删除该键值对
airports["APL"] = "Apple International"
airports["APL"] = nil

for a in airports
{
    print(a)
}

//从字典中删除键值对也可以使用removeValueForKey函数。如果该键值对存在，该函数就返回本删掉的值，如果不存在，就返回nil：
if let removedValue = airports.removeValue(forKey: "DUB"){
    print("The removed airport's name is \(removedValue).")
}else{
    print("The airports dictionary does not contain a value for DUB.")
}

//字典的迭代访问  可以通过for-in循环来迭代访问整个字典的键值对。它会对字典中的每个元素都会返回一个(key, value)元组，你可以把元组中的成员转为变量或常量来使用：
for (airportCode,airportName) in airports
{
    print("\(airportCode):\(airportName)")
}

//可以通过字典的keys属性和values属性，获得一个可以迭代访问的集合：
for airportCode in airports.keys
{
    print("Airport code : \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//如果需要将字典的所有键或者所有值放到一个Array对象里，可以直接使用字典的keys属性或者values属性：
let airportCodes = Array(airports.keys)
print(airportCodes)
let airportNames = Array(airports.values)
print(airportNames)

//生成一个空字典
var namesOfIntegers = Dictionary<Int,String>()
print(namesOfIntegers)

namesOfIntegers[2] = "two"
print(namesOfIntegers)

namesOfIntegers = [:]   //又变成一个空字典
print(namesOfIntegers)


//数组的不可变性跟字典略有不同。尽管你不能进行任何可能会改变数组大小的操作，但是你可以给数组中的某个索引设置一个新的值。这使得Swift的数组在大小固定的情况下能够达到最佳的性能
