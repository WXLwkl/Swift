//
//  main.swift
//  Swift方法
//
//  Created by yinjia on 15/12/7.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/*
如果你在第二个参数前写了一个散列符号（＃），这种行为则是有效的默认处理方法,在调用的时候必须提供外部名称.
相反的，如果你不想为一个方法的第二个参数或后续参数提供外部参数名，可通过使用下划线符号（_）作为该参数的显式外部参数名称来覆盖默认行为。
注:下划线符号和外部参数名之间要有空格.
*/



/*
修改值类型的实例方法

结构体和枚举都是值类型。默认情况下，值类型的属性不能从它的内部实例方法修改。

然而，如果你需要修改你的结构体或枚举的属性在一个特定的方法中，你可以在这个方法中选择加入变异行为。然后该方法可以变异（即改变）它的属性，任何的更改在方法结束时写回原来的结构里。该方法还可以分配一个新的实例到其隐含的self属性，而这个新的实例将取代现有的实例，当该方法结束时。

你可以加入这个行为，通过将mutating关键字写在方法的func关键字前：
*/

/**********************    实例方法      *******************/
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double)
    {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
println("The point is now at (\(somePoint.x), \(somePoint.y))")
// prints "The point is now at (3.0, 4.0)"


//请注意，你不能使用一个常量的结构类型去调用变异方法，因为它的属性不能被改变。即使它们使可变的属性，如常量结构体实例的存储属性的描述：
let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)

//由变异方法分配self

//变异方法可以分配一个全新的实例给隐式的self属性。上面所示的Point例子也可以勇下面的方式来替代：
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point1(x: x + deltaX, y: y + deltaY)
    }
}
//moveByX方法的mutating 版本创建了一个全新的结构体，并将x和y的值设置到目标位置。调用这个版本的方法的最终返回结果和调用之前版本的结果完全一样。

//枚举的变异方法可以在同一个枚举里为隐式的self设置不同的值：
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight is now equal to .High
ovenLight.next()
// ovenLight is now equal to .Off
//这个例子定义了一个具有三种状态供选择的枚举。每一次它的next方法被调用， 三种不同的电源状态（Off,Low和High）之间循环选择。


/*******************    类型方法    *****************/

/*
类型方法

如上所述，实例方法是由一个特定类型的实例调用的方法。你还可以定义由类型自身调用的方法。这种方法被称为类型方法。你可以通过在func 关键字前写上class 关键字来声明类的类型方法，而在结构体或枚举内定义类型方法则需在func关键字前书写static 关键字来声明。
类型方法的调用语法和实例方法的调用方法很像。但是，你只能通过类来调用类型方法，而不是通过这个类的实例来调用.
*/

class SomeClass {
    class func someTypeMethod()
    {
        println("这是一个类型方法")
    }
}
SomeClass.someTypeMethod()
//在类型方法体内，隐式的self属性引用类型本身，而不是该类型的一个实例。对于 结构体和枚举，这意味着你可以使用self来消除静态你操作静态属性、静态方法参数和实例属性和实例方法参数的歧义。

//更为普遍的是，你在一个类型方法体内使用任何不合格的方法和属性名称它都将引用其它类型级的方法和属性。一个类型方法可以通过其它的方法名来调用另一个类型方法，而不需要为类型名加前缀。同样，结构体和枚举的类型方法也能通过使用静态属性名访问静态属性，而不需要类型名做前缀。



struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int)
    {
        if level > highestUnlockedLevel
        {
            highestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level: Int) -> Bool
    {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool
    {
        if LevelTracker.levelIsUnlocked(level)
        {
            currentLevel = level
            return true
        }
        else
        {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int)
    {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) //advance进入,推进,提升
{
    println("player is now on level 6")
}
else
{
    println("level 6 has not yet been unlocked")
}




