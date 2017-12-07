//
//  main.swift
//  归档
//
//  Created by yinjia on 15/12/20.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation


class Student: NSObject,NSCoding {
    var name:String
    var age:Int32
    init(name:String,age:Int32) {
        self.name = name
        self.age = age
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "NAME")
        aCoder.encodeInt32(self.age, forKey: "AGE")
    }
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("NAME") as! String
        self.age = aDecoder.decodeInt32ForKey("AGE")
    }
}

var s = Student(name: "aa", age: 22)
var ss = Student(name: "bb", age: 23)
var sss = Student(name: "cc", age: 24)

//var arr = NSArray(objects: s,ss,sss)
////if arr.writeToFile("student.plist", atomically: true)
//if NSKeyedArchiver.archiveRootObject(arr, toFile: "student.plist")
//{
//    println("写文件成功!")
//}else{
//    println("写文件失败!")
//}

//NSKeyedArchiver.archiveRootObject(s, toFile: "strdent.plist")

if let zs:AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile("student.plist")
{
    for s in zs as! [Student]
    {
        println(s.name)
    }
}



























