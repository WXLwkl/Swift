//
//  main.swift
//  字典
//
//  Created by yinjia on 15/12/22.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

//字典是一种存储相同类型多重数据的存储器.
//每个值(value)都关联独特的键(key),键作为字典中得这个值数据的标识符.
//和数组中数据项不同,字典中的数据项是无序的.


/******************  swift字典  ********************************/

var students:Dictionary<Int,String> = [1:"张三",2:"李四"];
print(students)
var keys = Array(students.keys) //关键字的数组

for a in keys
{
//    print(a)
    print(students[a]!)
}

for (key,value) in students
{
    print("\(key):\(value)")
}

var dic:Dictionary<Int,String> = Dictionary()
//增 (改)
dic.updateValue("张", forKey: 1) //如果这个键对应没有值 就是添加; 如果有值那就是修改
dic.updateValue("王", forKey: 2)

print(dic.count)
print(dic[1]!)

//删
dic.removeValue(forKey: 1)
print(dic.count)



/*************  oc字典  ******************************/

/*
var zd:NSDictionary = ["1":"q","2":"w","3":"e","4":"r"]

var arr = zd.allKeys

print(zd["1"]!)

//for a in arr  //oc提供的
//{
//    println("\(a):\(zd.objectForKey(a)!)")
//}

for (key,value) in zd  //swift提供的
{
    print("\(key):\(value)")
}


var dic:NSMutableDictionary = NSMutableDictionary()
print(dic.count)
//增
dic.setValue("z", forKey: "1")   //如果这个键对应没有值 就是添加; 如果有值那就是修改
dic.setValue("w", forKey: "2")
for (k,v) in dic
{
    print("\(k):\(v)")
}
print(dic.count)
//删
dic.removeObjectForKey("1")
for (k,v) in dic
{
    print("\(k):\(v)")
}

*/

