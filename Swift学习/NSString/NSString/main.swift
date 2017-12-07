//
//  main.swift
//  NSString
//
//  Created by yinjia on 15/12/22.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation


var a:NSString = "abcDEF"
print(a.length)
print(a.isEqual(to: "123"))

print(a.substring(from: 5))

var r:NSRange = NSRange(location: 1,length: 3)
print(a.substring(with: r))

print(a.uppercased)

print(a.lowercased)

//var b = a + "w"
var b = (a as String) + "w"
print(b)

var c = a.appending("efg")
print(c)

var d:NSString = "12.3"
var dd = d.floatValue
print(dd)

var e:NSMutableString = "12.3"
//e.appendString("efg")
//e.insertString("abc", atIndex: 1)

//var rr:NSRange = NSRange(location: 1,length: 2)
//e.deleteCharactersInRange(rr)

var rr:NSRange = NSRange(location: 1,length: 2)
e.replaceCharacters(in: rr, with: "qwer")

print(e)















