//
//  ViewController.swift
//  iOS9联系人
//
//  Created by xingl on 16/6/22.
//  Copyright © 2016年 yjpal. All rights reserved.
//

import UIKit

import ContactsUI

class ViewController: UIViewController,CNContactPickerDelegate {

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func contactBtn(_ sender: UIButton) {
        
        let contactPicker = CNContactPickerViewController()
        
        contactPicker.delegate = self
        contactPicker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    //显示详细
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
        
        //这里是主线程
        
        let contact = contactProperty.contact
        let phoneNumber = contactProperty.value as! CNPhoneNumber
        print(contact.givenName)
        print(phoneNumber.stringValue)
        

        self.btn.setTitle("\(contact.familyName):\(phoneNumber.stringValue)", for: UIControlState())
        self.btn.setTitleColor(UIColor.red, for: UIControlState())
        
    }
    //单选
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let firstName = contact.givenName
        let lastName = contact.familyName
        
        let phoneNumbers = contact.phoneNumbers
        
        for labelValue:CNLabeledValue in phoneNumbers {
            
            let phoneNumber:CNPhoneNumber = labelValue.value 
            
            let phoneValue = phoneNumber.stringValue
            let phoneLabel = labelValue.label
            
            print(lastName + firstName + "\(phoneLabel) - > \(phoneValue)")
  
        }
 
    }
    //多选
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        
        for contact in contacts {
            let firstName = contact.givenName
            let lastName = contact.familyName
            print(firstName + lastName)
            
            let phoneNumbers = contact.phoneNumbers
            
            for labelValue:CNLabeledValue in phoneNumbers {
                
                let phoneNumber:CNPhoneNumber = labelValue.value 
                
                let phoneValue = phoneNumber.stringValue
                let phoneLabel = labelValue.label
                
                print(firstName + lastName + "\(phoneLabel) - > \(phoneValue)")
                
            }
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

