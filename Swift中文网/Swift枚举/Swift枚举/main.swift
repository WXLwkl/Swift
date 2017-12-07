//
//  main.swift
//  Swift枚举
//
//  Created by yinjia on 15/11/30.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation


//枚举语法
//可以用enum开始并且用大括号包含整个定义体来定义一个枚举:
enum SomeEnumeration {
    // 在这里定义枚举
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}

//多个成员还可以用一行来定义，他们之间用逗号分割:
enum Planet{
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West

directionToHead = .East

switch directionToHead {
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}

//如果给考虑每个枚举的成员不合适，你可以提供一个default来覆盖其他没有明确处理的成员:
let somePlanet = Planet.Mars
switch somePlanet {
case .Earth:
    println("Mostly harmless")
default:
    println("Not a safe place for humans")
}

enum Planet1: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
//如果原始值是整数类型，那么当其他枚举成员没有设置原始值的时候，他们的原始值是这个整型原始值自增长设置的。
//let earthsOrder = Planet1.Earth.toRaw()
let earthsOrder = Planet1.Earth.rawValue
println(earthsOrder)


