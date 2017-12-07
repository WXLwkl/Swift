//
//  trim.swift
//  扩展
//
//  Created by yinjia on 15/12/19.
//  Copyright (c) 2015年 yinjia. All rights reserved.
//

import Foundation

extension NSString
{
    func trim()->NSString
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}


extension String
{
    subscript(index:Int)->String
        {
            var begin = self.startIndex
            var start = advance(begin, index)
            var end = advance(begin, index+1)
            var range = Range(start:start,end:end)
            return self.substringWithRange(range)
    }
}









