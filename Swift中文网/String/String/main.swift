//
//  main.swift
//  String
//
//  Created by yinjia on 15/11/25.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

var emptyString = "" //空字符串字面量
var anotherEmptyString = String() //初始化String实例
if emptyString.isEmpty
{
    print("空")
}

/*
转义字符 \0 (空字符)、 \\ (反斜线)、 \t (水平制表符)、 \n (换行符)、 \r (回车符)、 \" (双引号)、 \' (单引号)。
单字节 Unicode 标量，写成 \xnn ，其中 nn 为两位十六进制数。
双字节 Unicode 标量，写成 \unnnn ，其中 nnnn 为四位十六进制数。
四字节 Unicode 标量，写成 \Unnnnnnnn ，其中 nnnnnnnn 为八位十六进制数。
*/

let a = "\"我是要成为海贼王的男人\" --路飞"

print(a)

//字符串拼接
var x = "x"
var y = "y"
var z = x + y
var m = z + "m"
var n = "n"
n += m

var result = "\(x)==\(y)==\(z)==\(m)==\(n)"
print(result)  // x==y==xy==xym==nxym

//字符串与字符拼接
//let s1 = "hello"
//let c1:Character = "!"
//let plus1 = s1 + c1
//let plus2 = c1 + s1
//
//println(plus1)

let s1 = "hello"
let c1 = "!"   //不能用 let c1:Character = "!"
let plus1 = s1 + c1
let plus2 = c1 + s1

print("这里是\(plus1)")

//字符串遍历
var myString = "This is a string"
for character in myString.characters
{
    print(character)
}

//统计字符串个数
var myString1 = "string"
print(myString1.characters.count)

//字符串比较&&是否包含前后缀
var check1:String = "Swift is good"
var check2:String = "Swift"

if check1 == check2
{
    print("check1 = check2")
}
else
{
    print("check1 != check2")
}

var preCheck = "Swift"
if check1.hasPrefix(preCheck)
{
    print("包含前缀Swift")
}

var sufCheck = "good"
if check1.hasSuffix(sufCheck)
{
    print("包含后缀good")
}

//大小写转换
let myString2 = "Wait a moment"

let newString2 = myString2.uppercaseString

let newString21 = myString2.lowercaseString
print(newString2)
print(newString21)

//字符串是否包含其他字符串
var myString3 = "This is a string test"
if (myString3.rangeOfString("string") != nil) {
    print("yes")
}

//字符串截取
let myString4 = "ABCDEFG"
let mySubstring = (myString4 as NSString).substringFromIndex(2)
print(mySubstring)

//1.将String转化为NSString再截取,代码如下:
var s = "1234567890"
var ns1 = (s as NSString).substringFromIndex(5)
var ns2 = (s as NSString).substringToIndex(4)
var ns3 = (s as NSString).substringWithRange(NSMakeRange(4, 1))
print(ns1)
print(ns2)
print(ns3)
//2.直接调用String的对应方法(推荐使用该方法),由于String对应的方法参数是String.Index类型而非Int类型,所以我们首先要创建String.Index类型参数值,代码如下：

let index = s.startIndex.advancedBy(5)
let index2 = s.endIndex.advancedBy(-6)
var s11:String = s.substringFromIndex(index)
var s22:String = s.substringToIndex(index2)
print("----------------\(s22)---------------------\(s11)")


/*      swift 2.0+

let index = s.startIndex.advancedBy(5) //swift 2.0+
let index2 = s.endIndex.advancedBy(-6) //swift 2.0+
var range = Range<String.Index>(start: index2,end: index)
var s1:String=s.substringFromIndex(index)
var s2:String=s.substringToIndex(index2)
var s3=s.substringWithRange(range)

print(s1)//67890
print(s2)//1234
print(s3)//5

extension String{
    subscript(r:Range<Int>)-> String {
        get{
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = self.startIndex.advancedBy(r.endIndex)
            
            return self[Range(start: startIndex, end: endIndex)]
        }
    }
}
var s4 = s[2...4]
println(s4)
*/

//字符串去空格
var myString5 = "   let's trim the whitespace  "
var newString5 = myString5.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
print(newString5)

//字符串分割为字符串数组
//单一分隔符:只有一种分割符
var myString6 = "a,b,c,d,e,f,g"
//1.隐式定义字符串数组
var myArray = myString6.componentsSeparatedByString(",")
//2.显示定义字符串数组
var myArray2:[String] = myString6.componentsSeparatedByString(",")
for a in myArray
{
    print(a)
}

for a in myArray2
{
    print(a)
}
//多重分割符:有2个或两个以上分隔符
var myString7 = "One-Two-Three-1*2*3"
var array:[String] = myString7.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "-*"))
for string in array
{
    print(string)
}

//字符串转换为NSData
var myString8 = "String to encode"
let string:NSString = myString8
let data = string.dataUsingEncoding(NSUTF8StringEncoding)
print(data!)


//替换   把?替换为/
var url = "http://blog.csdn.net/hello_hwc?viewmode=list"

var filtered1 = url.stringByReplacingOccurrencesOfString("?", withString: "/", options: NSStringCompareOptions.LiteralSearch, range: nil)
print(filtered1)

//过滤单个字符 /
var filtered2 = url.stringByReplacingOccurrencesOfString("/", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)

print(filtered2)

//分割
//对字符串使用/作为分隔符来切割，不允许空字符串 
let splitedArray = url.characters.split{$0 == "/"}.map { String($0) }
for a in splitedArray
{
    print(a)
}

//对字符串使用/作为分隔符来切割，允许空字符串 

let arrayResult = url.characters.split(maxSplit: url.lengthOfBytesUsingEncoding(NSUTF8StringEncoding), allowEmptySlices: true){
    (char:Character)-> Bool in
    return char == "/"
}.map { String($0) }

for a in arrayResult
{
    print(a)
}

//拼接
let mm = ["1","2","3"];
let resultMM = mm.joinWithSeparator("/")
print(resultMM)
