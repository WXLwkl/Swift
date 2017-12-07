//
//  main.swift
//  容量
//
//  Created by xingl on 16/5/12.
//  Copyright © 2016年 yjpal. All rights reserved.
//

import Foundation


let fm = NSFileManager.defaultManager()

let att = try? fm.attributesOfFileSystemForPath(NSHomeDirectory())

let a = att![NSFileSystemSize]?.longLongValue
let b = att![NSFileSystemFreeSize]?.longLongValue

print("容量:\(a!/1000000000)G")
print("可用:\(b!/1000000000)G")



var dic = ["a":"A","b":"B"]
//  ["key":"value","key":"value"]

for aa in dic.keys {
    print(aa)
}

var empty = [String]()

empty.append("a")
empty.append("b")
print(empty.count)


var arr = [1,2,3,4]

arr += [5,6]

print(arr)







