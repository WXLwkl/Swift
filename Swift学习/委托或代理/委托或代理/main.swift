//
//  main.swift
//  委托或代理
//
//  Created by yinjia on 15/12/20.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

/*
class UIApplication {
    var name:String?
    func comeClick()
    {
        println("\(name!) is do click!")
    }
    func comeDBClick()
    {
        println("\(name!) is do DBclick!")
    }
    func comeDrag()
    {
        println("\(name!) is do drag!")
    }
}

var app = UIApplication()
app.name = "画图"
app.comeClick()
*/

class UIApplication { //应用程序类
    var name:String?
    var delegate:UIApplicationDelegate?
    func comeClick()
    {
        delegate?.click()
    }
    func comeDBClick()
    {
        delegate?.dbClick()
    }
    func comeDrag()
    {
        delegate?.drag()
    }
}

protocol UIApplicationDelegate //应用程序代理协议
{
    func click()
    func dbClick()
    func drag()
}

class AppDelegate:UIApplicationDelegate { //应用程序代理类
    var name:String?
    func click()
    {
        println("\(name!) is do click!")
    }
    func dbClick()
    {
        println("\(name!) is do DBClick!")
    }
    func drag()
    {
        println("\(name!) is do Drag!")
    }
}

var app = UIApplication()
app.name = "应用程序"
var appdelegate = AppDelegate()
appdelegate.name = "应用程序代理"
app.delegate = appdelegate
app.comeDrag()




























