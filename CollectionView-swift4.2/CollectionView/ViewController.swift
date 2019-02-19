//
//  ViewController.swift
//  CollectionView
//
//  Created by xingl on 2019/1/25.
//  Copyright © 2019 xingl. All rights reserved.
//

import UIKit

private let kNormalCellID = "kNormalCellID"

class ViewController: UIViewController {

    let data: [[String: Any]] = [
        ["text": "基本使用", "class": "BaseCollectionViewController"],
        ["text": "瀑布流", "class": "WaterFlowViewController"],
        ["text": "CoverFlow效果", "class": "CoverFlowViewController"],
        ["text": "轮转卡片", "class": "CircularCollectionViewController"],
        ["text": "模仿今日头条实现Cell重排", "class": "MoveCollectionViewController"],
        ["text": "iOS9用系统属性实现Cell重排", "class": "InteractiveMoveViewController"],
        ["text": "iOS10预加载", "class": "PrefecthingCollectionViewController"]
    ]
    
    lazy var tableView: UITableView = { [weak self] in
        let tableView = UITableView(frame: view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
//        if #available(iOS 11.0, *) {
//            tableView.contentInsetAdjustmentBehavior = .never
//        } else {
//            self!.automaticallyAdjustsScrollViewInsets = false
//        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kNormalCellID)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    /// 类文件字符串转换为ViewController
    ///
    /// - Parameter childControllerName: VC的字符串
    /// - Returns: ViewController
    func convertController(_ childControllerName: String) -> UIViewController? {
        
        // 1.获取命名空间
        // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            return nil
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childControllerName)
        
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            return nil
        }
        
//        if clsType is UICollectionViewController.Type {
//            let coll = clsType as! UICollectionViewController.Type
//            let collCls = coll.init(collectionViewLayout: CircularCollectionViewLayout())
//            return collCls
//        }
        
        // 3.通过Class创建对象
        let childController = clsType.init()
        
        return childController
    }
}

// MARK: - 配置UI
extension ViewController {
    
    func setupUI() {
        navigationItem.title = "Root"
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kNormalCellID, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]["text"] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let className = data[indexPath.row]["class"] as! String
        let cls = convertController(className)!
        navigationController?.pushViewController(cls, animated: true)
    }
}

