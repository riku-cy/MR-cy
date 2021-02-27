//
//  setLabel.swift
//  bot
//
//  Created by 向山陸 on 2020/12/16.
//

import Foundation
import UIKit

class EditLabel: UIViewController {

    func setColor(){
        n1.textColor = UIColor.red
        n2.textColor = UIColor.red
        n3.textColor = UIColor.red
        n4.textColor = UIColor.red
        
        let rgba = UIColor(red: 200/255, green: 210/255, blue: 250/255, alpha: 1.0)
        L1.backgroundColor = rgba
        L1.layer.cornerRadius = 10.0
        L1.clipsToBounds = true
        L1.layer.borderWidth = 0
        L1.layer.borderColor = UIColor.white.cgColor
        
        L2.backgroundColor = rgba
        L2.layer.cornerRadius = 10.0
        L2.clipsToBounds = true
        L2.layer.borderWidth = 0
        L2.layer.borderColor = UIColor.white.cgColor
        
        L3.backgroundColor = rgba
        L3.layer.cornerRadius = 10.0
        L3.clipsToBounds = true
        L3.layer.borderWidth = 0
        L3.layer.borderColor = UIColor.white.cgColor
        
        L4.backgroundColor = rgba
        L4.layer.cornerRadius = 10.0
        L4.clipsToBounds = true
        L4.layer.borderWidth = 0
        L4.layer.borderColor = UIColor.white.cgColor
        
        L5.backgroundColor = rgba
        L5.layer.cornerRadius = 10.0
        L5.clipsToBounds = true
        L5.layer.borderWidth = 0
        L5.layer.borderColor = UIColor.white.cgColor
        
        L6.backgroundColor = rgba
        L6.layer.cornerRadius = 10.0
        L6.clipsToBounds = true
        L6.layer.borderWidth = 0
        L6.layer.borderColor = UIColor.white.cgColor
    }
}
