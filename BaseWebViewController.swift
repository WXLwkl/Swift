//
//  BaseWebViewController.swift
//  SwiftDemo
//
//  Created by xingl on 2017/5/19.
//  Copyright © 2017年 yjpal. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class BaseWebViewController: RootViewController {

    var rootURLString: String?
//    var progresslayer = CALayer()
//    var webView: WKWebView!
    
    fileprivate var progressView: UIProgressView!
    fileprivate var webView: WKWebView!
    
    var button: UIButton?
    
    var isNavHidden = false
    
    public convenience init(url: String) {
        self.init()
        self.rootURLString = url
//        loadUrlSting(urlString: url)
    }
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationItem.title = "加载中..."
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = isNavHidden
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    func setupUI() {
        
        
        addWkWebView()
        addProgressView()
        
//        configBackItem()
//        configMenuItem()
    }
    //添加wkWebView
    fileprivate func addWkWebView() {
        // 创建webveiew
        // 创建一个webiview的配置项
        let configuretion = WKWebViewConfiguration()
        
        // Webview的偏好设置
        configuretion.preferences = WKPreferences()
        configuretion.preferences.minimumFontSize = 10
        configuretion.preferences.javaScriptEnabled = true
        
        // 默认是不能通过JS自动打开窗口的，必须通过用户交互才能打开
        configuretion.preferences.javaScriptCanOpenWindowsAutomatically = false
        
        // 通过js与webview内容交互配置
        configuretion.userContentController = WKUserContentController()
        
        
//        configuretion.userContentController.add(self as! WKScriptMessageHandler, name: "closeWindow")
        
        webView = WKWebView(frame:view.bounds, configuration: configuretion)
        
        //开启手势交互
        webView.allowsBackForwardNavigationGestures = true
        
        webView?.navigationDelegate = self
        
        webView?.uiDelegate = self
        
        // 监听支持KVO的属性
        webView?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        //内容自适应
        webView.sizeToFit();
        
        view.addSubview(webView!);
    }
    
    //添加进度条
    fileprivate func addProgressView() {
        
        progressView = UIProgressView(progressViewStyle: .default)
        if isNavHidden == true{
            progressView?.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 3)
        }else{
            progressView?.frame = CGRect(x: 0, y: 64, width: view.bounds.size.width, height: 3)
        }
        progressView?.progress = 0.05
        progressView?.trackTintColor = UIColor.clear
        progressView?.progressTintColor = UIColor.red
        
        view.addSubview(progressView!)
    }
    
    
    func configBackItem() {
        
        let goBackItem = UIButton.init(type: .custom)
        goBackItem.setImage(UIImage(named: "Nav_goBack"), for: .normal)
        goBackItem.sizeToFit()
        goBackItem.frame.size = CGSize(width: 30, height: 30)
        goBackItem.contentHorizontalAlignment = .right
        goBackItem.addTarget(self, action: #selector(BaseWebViewController.goBack), for: .touchUpInside)
        let item = UIBarButtonItem.init(customView: goBackItem)
        navigationItem.leftBarButtonItem = item
    }
    func configMenuItem() {
        let menuBtn = UIButton.init(type: .custom)
        menuBtn.setTitle("...", for: .normal)
        menuBtn.sizeToFit()
        menuBtn.contentHorizontalAlignment = .right
        menuBtn.addTarget(self, action: #selector(BaseWebViewController.showMenu), for: .touchUpInside)
        let menuiitem = UIBarButtonItem.init(customView: menuBtn)
        navigationItem.rightBarButtonItem = menuiitem
    }
    func configCloseItem() {
        let closeBtn = UIButton(type: .custom)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.sizeToFit()
        closeBtn.addTarget(self, action: #selector(BaseWebViewController.closeBtnClick), for: .touchUpInside)
        let closeItem = UIBarButtonItem(customView: closeBtn)
        let newArr = NSMutableArray(array: [navigationItem.leftBarButtonItem ?? "", closeItem])
        self.navigationItem.leftBarButtonItems = newArr as? [UIBarButtonItem]
    }
    
    func goBack() {
        if (self.webView?.canGoBack)! {
            self.webView?.goBack()
            if navigationItem.leftBarButtonItems?.count == 1 {
                configCloseItem()
            }
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    func showMenu() {
        
        let urlStr = self.webView?.url?.absoluteString
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) { (action:UIAlertAction!) -> Void in
            printLog(urlStr)
            print("点击的是取消")
        }
        let safariAction = UIAlertAction(title: "safari打开", style: UIAlertActionStyle.default) { (action:UIAlertAction!) -> Void in
            
            print("safari打开")
            UIApplication.shared.openURL(URL(string: urlStr!)!)
        }
        let copyAction = UIAlertAction(title: "复制链接", style: UIAlertActionStyle.default) { (action:UIAlertAction!) -> Void in
            
            print("复制链接")
            
        }
        let shareAction = UIAlertAction(title: "分享", style: UIAlertActionStyle.default) { (action:UIAlertAction!) -> Void in
            
            print("分享")
            
        }
        let refreshAction = UIAlertAction(title: "刷新", style: UIAlertActionStyle.default) { (action:UIAlertAction!) -> Void in
            self.webView?.reload()
            print("刷新")
            
        }
        sheet.addAction(cancelAction)
        sheet.addAction(safariAction)
        sheet.addAction(copyAction)
        sheet.addAction(shareAction)
        sheet.addAction(refreshAction)
        
        self.present(sheet, animated: true, completion: nil)
    }
    func closeBtnClick() {
        navigationController?.popViewController(animated: true)
    }
    deinit {
        webView?.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress"{
            
            progressView.alpha = 1.0
            let animated = Float(webView.estimatedProgress) > progressView.progress;
            
            progressView .setProgress(Float(webView.estimatedProgress), animated: animated)

            self.progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            
            if Float(webView.estimatedProgress) >= 1.0{
                
                //设置动画效果，动画时间长度 1 秒。
                UIView.animate(withDuration: 1, delay:0.01,options:UIViewAnimationOptions.curveEaseOut, animations:{()-> Void in
                    
                    self.progressView.alpha = 0.0
                    
                },completion:{(finished:Bool) -> Void in
                    
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadUrlSting(urlString:String!) {
        guard urlString.characters.count > 0 else {
            return
        }
        
        let url = URL(string: urlString)

//        loadURL(url!)
        
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    func loadURL(_ url: URL) {
        webView.load(NSURLRequest(url: url) as URLRequest)
    }
    func loadHTMLSting(string: String!, baseURL: URL) {
        let HTMLDocumentPath = Bundle.main.path(forResource: "index", ofType: "html")
        let HTMLString: NSString?
        
        do {
            HTMLString = try NSString(contentsOfFile: HTMLDocumentPath!, encoding: String.Encoding.utf8.rawValue)
            
            webView.loadHTMLString(HTMLString! as String, baseURL: nil)
            
        } catch {
            HTMLString = nil
        }
    }
 
    
}
extension BaseWebViewController: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
    }
//    webView内容加载失败后提示
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        guard let btn = button else {
            button = UIButton(type: .system)
            button?.frame = CGRect(x: 0, y: 3, width: kScreenW, height: kScreenH - 60 - 3)
            button?.backgroundColor = UIColor.white
            button?.setTitle("重新加载", for: .normal)
            button?.setTitleColor(UIColor.darkText, for: .normal)
            button?.addTarget(self, action: #selector(BaseWebViewController.reloadURL), for: .touchUpInside)
            view.addSubview(button!)
            return
        }
        btn.isHidden = false
    }
    
    func reloadURL() {
        button?.isHidden = true
        if rootURLString == "" {
            return
        }
        
        let request = URLRequest(url: URL(string: rootURLString!)!)
        webView.load(request)
    }
}




