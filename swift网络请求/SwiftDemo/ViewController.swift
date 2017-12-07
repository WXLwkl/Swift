//
//  ViewController.swift
//  SwiftDemo
//
//  Created by xingl on 2016/10/25.
//  Copyright © 2016年 yjpal. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController ,WKNavigationDelegate,WKUIDelegate{

    var webV = WKWebView()
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    
    @IBOutlet weak var shortLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let rect = CGRect(x: 10, y: 200, width: 300, height: 50)
//        let label = UILabel(frame: rect)
//        label.text = "这个是label"
//        label.backgroundColor = UIColor.red
//        label.textAlignment = NSTextAlignment.center
//        self.view.addSubview(label)
//        label.layer.cornerRadius = 10.0
//        label.layer.masksToBounds = true
//        
//        let img = UIImage(named: "2")
//        let imgV = UIImageView(image: img)
//        
//        self.view.addSubview(imgV)
        
        
//        let size = UIScreen.main.bounds.size
        
        
        let filePath = Bundle.main.path(forResource: "银嘉钱包", ofType: "html")
        webV = WKWebView(frame: self.view.bounds)
        webV.navigationDelegate = self
        webV.uiDelegate = self
        webV.load(URLRequest(url: URL(fileURLWithPath: filePath!)))
        
        self.view.addSubview(webV)
        
        return
        
//        bc7ff5a8d569ee51188f551b11fed641
        
//        MARK: - 延时执行
        Thread.sleep(forTimeInterval: 2)
        
        perform(#selector(printA), with: self, afterDelay: 3)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) { 
            print("AAAAAAAA")
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
//            repeats 是否执行一次 如果为true就是一直执行
            print(timer)
        }
//        MARK: - -------
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("生成短链接", for: UIControlState())
        btn.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        btn.frame = CGRect(x: 0, y: 400, width: 400, height: 50)
        
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        btn.layer.borderColor = UIColor.blue.cgColor
        btn.layer.borderWidth = 5
        
        btn.addTarget(self, action: #selector(ViewController.postRequestBtnClick(_:)), for: UIControlEvents.touchUpInside)
        
        self.view .addSubview(btn)
        
        
        print(Thread.current)
    }
    
    func printA() {
        print("------------")
    }
    
    func postRequestBtnClick(_ sender:UIButton) {
      
        
        
        let url = "http://61.129.127.21:18078/WXBackGround/pointGoods/queryPointGoods.action"
        let httpArg = "userInfo.shopCode=S00012"
        shortLine(httpUrl: url, httpArg: httpArg)
    }
//    TODO: - POST请求
    func shortLine(httpUrl:String,httpArg:String) {
        
        let request = NSMutableURLRequest(url: NSURL(string: httpUrl)! as URL)
        request.httpMethod = "POST"
        request.httpBody = httpArg.data(using: .utf8)
        
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        let session:URLSession = URLSession(configuration: config)
        
        let task:URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let res = response as! HTTPURLResponse
            print(res.statusCode)
            
            if error == nil {
                do {
                    let responseData:NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    
                    DispatchQueue.main.async(execute: { 
                        if let goods = responseData.object(forKey: "pointGoodsList") as? NSArray {
                            
                            let firstGood = goods.firstObject as! NSDictionary
                            self.shortLabel.text = (firstGood.object(forKey: "goodsName") as? String)! + " 需要金币:" + (firstGood.object(forKey: "marketPrice") as? String)!
                        }
                    })
                    
                } catch {
                    print("catch")
                }
            } else {
                print("error:\(String(describing: error))")
            }
            
            
        }
        task.resume()
    }
    
    @IBAction func requestDataBtnClick(_ sender: UIButton) {
        let url = "http://apis.baidu.com/apistore/idservice/id"
//        let httpArg = "id=\(IDTextField.text!)"
        
        let httpArg = "id=412727199001095732"
        request(httpUrl: url, httpArg: httpArg)
        
    }
//    TODO: - GET请求
    func  request(httpUrl: String, httpArg: String) {
        let req = NSMutableURLRequest(url: NSURL(string: httpUrl + "?" + httpArg)! as URL)
        req.timeoutInterval = 6
        req.httpMethod = "GET"
        req.addValue("bc7ff5a8d569ee51188f551b11fed641", forHTTPHeaderField: "apikey")
        let session: URLSession = URLSession.shared
        let dataTask: URLSessionDataTask = session.dataTask(with: req as URLRequest) { (data, response, error) in
            
            let res = response as! HTTPURLResponse
            print(res.statusCode)
            if error != nil{
                print("请求失败")
            }
            
            print(Thread.current)
            
            if let d = data {
                let dict: NSDictionary = (try! JSONSerialization.jsonObject(with: d, options: .allowFragments)) as! NSDictionary
                
                print(dict["retData"] ?? "AA")
                
                DispatchQueue.main.async(execute: {
                    
                    print(Thread.current)
                    
                    if let retDataD = dict.object(forKey: "retData") as? NSDictionary {
                        
                        
                        self.addressLabel.text = retDataD.object(forKey: "address") as? String
                        self.birthdayLabel.text = retDataD.object(forKey: "birthday") as? String
                        
                        switch(retDataD["sex"] as! String){
                            
                        case "M":
                            self.sexLabel.text = "男"
                            
                        case "N":
                            self.sexLabel.text = "女"
                            
                        default:
                            self.sexLabel.text = "未知"
                            
                        }
                        
                    }
                })
                
                
            }
        }
        dataTask.resume()
  
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        self.self.navigationItem.title = webView.title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

