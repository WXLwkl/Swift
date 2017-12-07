//
//  ViewController.swift
//  MJ-刷新
//
//  Created by xingl on 16/5/15.
//  Copyright © 2016年 yjpal. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    var array = ["1","2","3","4","5"]
    
    
    let size = UIScreen.main.bounds.size
    
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: UITableViewStyle.grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ID")
        
//        tableView.backgroundColor = UIColor.redColor()
        self.view.addSubview(tableView)
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(ViewController.requestInfo))
    
//        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: Selector("requestMoreInfo"))
        
//        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
//            print("-------")
//            self.array.append("LL")
//            tableView.mj_header.endRefreshing()
//            tableView.reloadData()
//        })
//    }
        
        tableView.mj_footer = MJRefreshAutoFooter(refreshingBlock: { 
            print("--------")
        })
        
        
        
}
        
    func requestInfo() {
        self.array.insert("0", at: 0)

        tableView.mj_header.endRefreshing()
        tableView.reloadData()
        
    }
//
//    func requestMoreInfo() {
//        self.array.append("LL")
//        tableView.mj_footer.endRefreshing()
//        tableView.reloadData()
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID", for: indexPath as IndexPath)

        cell.textLabel?.text = self.array[indexPath.row]

        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator //显示想右的箭头
        
        cell.selectionStyle = UITableViewCellSelectionStyle.gray
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let top = UITableViewRowAction(style: .normal, title: "置顶") {
            action, index in
            print("more button tapped")
            self.alertShow(title: "置顶")
        }
        top.backgroundColor = UIColor.lightGray
        
        let readed = UITableViewRowAction(style: .normal, title: "标为已读") {
            action, index in
            print("favorite button tapped")
            self.alertShow(title: "标为已读")
        }
        readed.backgroundColor = UIColor.orange
        
        let delete = UITableViewRowAction(style: .normal, title: "删除") {
            action, index in
            print("share button tapped")
            self.alertShow(title: "删除")
        }
        delete.backgroundColor = UIColor.blue
        
        return [top, readed, delete]
    }
    func alertShow(title:String)
    {
        let alertView = UIAlertView(title: nil, message: title, delegate: nil, cancelButtonTitle: "知道了");
        alertView.show()
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // 要显示自定义的action,cell必须处于编辑状态
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 同时你也需要实现本方法,否则自定义action是不会显示的,啦啦啦
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

