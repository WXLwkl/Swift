//
//  RootViewController.swift
//  SwiftDemo
//
//  Created by xingl on 2017/5/3.
//  Copyright © 2017年 yjpal. All rights reserved.
//

import UIKit


class RootViewController: UIViewController {

    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "随便点击页面，看看效果"
        
        UITableView
        
        let v = UILabel(frame: CGRect(x: 50, y: 100, width: 50, height: 50));
        v.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        v.text = "AAAA"
        v.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(v);
        v.clipRectCorner(direction: [.topLeft, .topRight], cornerRadius: 15)
        
        let btn = UIButton(type: .custom)
        btn.backgroundColor = #colorLiteral(red: 0.33261408, green: 1, blue: 0.7544312378, alpha: 1)
        btn.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        view.addSubview(btn)
        
        btn.clipRectCorner(direction: .allCorners, cornerRadius: 10)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let titles = ["发起群聊", "添加朋友", "扫一扫", "收付款", "拍摄", "面对面传"]
        let icons = ["searchbutton_nor", "searchbutton_nor", "searchbutton_nor", "searchbutton_nor", "searchbutton_nor", "searchbutton_nor"]
        let pop = XLPopMenu(titles: titles as NSArray, icons: icons as NSArray, menuWidth: 150)
        
        pop.kCornerRadius = 7
        pop.type = .dark
        pop.offset = 0
        let p = touches.first
        let pointInview = p?.location(in: self.navigationController?.view)
        //        pop.isShowShadow = false
        pop.showMenu(at: pointInview!)
        
        
        
        pop.popMenuDidSelectedBlock = { (index, title) in
            
            print("----\(index)--\(title)")
            
        }
    }
        
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
