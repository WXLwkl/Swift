//
//  TestTableViewController.swift
//  CyclePictureView
//
//  Created by wl on 15/11/9.
//  Copyright © 2015年 wl. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    var cyclePictureView: CyclePictureView!
    var dataArray: Array? = { () -> NSArray? in 
        let path = Bundle.main.path(forResource: "Image.plist", ofType: nil)!
        var array = NSArray(contentsOfFile: path)
        return array
        }() as Array?
    var imageURLArray: [String] = []
    var imageDetailArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<dataArray!.count {
            imageURLArray.append(dataArray![i]["image"] as! String)
            imageDetailArray.append(dataArray![i]["title"] as! String)
        }
        
        let cyclePictureView = CyclePictureView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 200), imageURLArray: nil)
        cyclePictureView.backgroundColor = UIColor.red
        cyclePictureView.imageURLArray = imageURLArray
        cyclePictureView.imageDetailArray = imageDetailArray
        cyclePictureView.timeInterval = 1
        self.tableView.tableHeaderView = cyclePictureView
    }

    deinit {
        //print("TestTableViewController----deinit")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "test\(indexPath.row)"
        
        return cell
    }



}
