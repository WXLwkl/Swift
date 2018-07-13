//
//  ViewController.swift
//  NumberDemo
//
//  Created by xingl on 2018/4/18.
//  Copyright © 2018年 xingl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textField = UITextField()
    var numberLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    func configUI() {
        textField = UITextField(frame: CGRect(x: 0, y: 50, width: 200, height: 50))
        textField.borderStyle = UITextBorderStyle.bezel
        view.addSubview(textField)
        
        let button = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: 210, y: 50, width: 100, height: 50)
        button.setTitle("tip me", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(changeBtnClick(btn:)), for: .touchUpInside)
        view.addSubview(button)
        
        numberLabel.frame = CGRect(x: 0, y: button.frame.maxY + 10, width: view.frame.width, height: 100)
        numberLabel.numberOfLines = 0
        numberLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        numberLabel.backgroundColor = #colorLiteral(red: 1, green: 0.4347440709, blue: 0.379393076, alpha: 1)
        view.addSubview(numberLabel)
        
    }
    
    @objc func changeBtnClick(btn: UIButton) {

        let num = textField.text
        let str = num?.numberRMM()
        numberLabel.text = str
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension String {
    func numberRMM() -> String {
        guard let num = Double(self) else {
            return "异常"
        }
        let format = NumberFormatter()
        format.locale = Locale(identifier: "zh_CN")
        format.numberStyle = .spellOut
        format.minimumIntegerDigits = 1
        format.minimumFractionDigits = 0
        format.maximumFractionDigits = 2
        let text = format.string(from: NSNumber(value: num)) ?? "" //中文数字
        
        let sept = self.components(separatedBy: ".")
        let decimals:Double? = sept.count == 2 ? Double("0." + sept.last!) : nil
        return self.formatRMM(text: text, isInt: decimals == nil || decimals! < 0.01)
    }
    
    private func formatRMM(text: String, isInt: Bool) -> String {
        
        let formattedString = text.replacingOccurrences(of: "一", with: "壹").replacingOccurrences(of: "二", with: "贰").replacingOccurrences(of: "三", with: "叁").replacingOccurrences(of: "四", with: "肆").replacingOccurrences(of: "五", with: "伍").replacingOccurrences(of: "六", with: "陆").replacingOccurrences(of: "七", with: "柒").replacingOccurrences(of: "八", with: "捌").replacingOccurrences(of: "九", with: "玖").replacingOccurrences(of: "十", with: "拾").replacingOccurrences(of: "百", with: "佰").replacingOccurrences(of: "千", with: "仟").replacingOccurrences(of: "万", with: "萬").replacingOccurrences(of: "〇", with: "零")
        
        let sept = formattedString.components(separatedBy: "点")
        var intStr = sept[0]
        if sept.count > 0 && isInt {
            return intStr.appending("元整")
        } else {
            // 小数
            let decStr = sept[1]
            
            
            intStr = intStr.appending("元").appending("\(decStr.first!)角")
            if decStr.count > 1 {
                intStr = intStr.appending("\(decStr[decStr.index(decStr.startIndex, offsetBy: 1)])分")
            } else {
                intStr = intStr.appending("零分")
            }
            return intStr
        }
    }
}
