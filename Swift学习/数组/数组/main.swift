//
//  main.swift
//  数组
//
//  Created by yinjia on 15/12/22.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation


/*****************   swift数组   ***************************/

var sz = [1,2,3,4,5]
//var sz = [Point(v:1,h:1),Point(v:2,h:2),Point(v:3,h:3)];
print(sz)

class Student {
    var name:String
    init(name:String)
    {
        self.name = name
    }
}
var arr = [Student(name: "1"),Student(name: "2"),Student(name: "3"),Student(name: "4"),1];
print(arr)

//for s in sz
//{
//    println(s)
//}

print(sz[0])

sz += [6,7]
//修改
//sz[1] = 22
//sz[1...3] = [22]
//sz[1...3] = []

//添加
sz.append(8)
//sz.startIndex 开始的索引
//sz.endIndex 结束的索引

print(sz.first!,sz.last!)

//移除
//sz.removeAtIndex(1)

print(sz)

var b = sz.reverse() //倒序

print(b)

//println(sz.count) //数组元素的个数

var a = [1,3,6,4,3,8,2,7]
a.sortInPlace{$0 < $1} //排序
print(a)

print("----------------------------")

var aa = [Int]()
aa.append(1)
aa.append(2)
aa.insert(3, atIndex: 1)
print(aa)

//放置重复的值  10个1
var aaa = Array(count: 10, repeatedValue: 1)
print(aaa)
for (index,value) in aaa.enumerate()
{
    print("\(index):\(value)")
}



/******************  oc里的数组  ********************************/

/*

var sz:NSArray = [1,2,3,4];
print(sz.count)

//for i in sz{
//    println(i)
//}

//var  sz1:NSArray = [Point(v:1,h:1),Point(v:2,h:2),Point(v:3,h:3)];

var points:NSMutableArray = NSMutableArray()  //创建一个空的动态的数组

points.addObject(NSValue(point:CGPointMake(1, 1)))
points.addObject(NSValue(point:CGPointMake(2, 2)))
points.addObject(NSValue(point:CGPointMake(3, 3)))

print(points.count)

for p in points
{
    var b = p.pointValue
    print(b)

}

var arr:NSMutableArray = [1,2,3,4,5];
print(arr)
//增
//arr.addObject(6)
//插入
arr.insertObject(6, atIndex: 3)
//删
//arr.removeLastObject()
//替换
arr.replaceObjectAtIndex(1, withObject: 50)
print(arr)

*/