//
//  Styling.swift
//  firstApp
//
//  Created by Gandom on 7/17/22.
//
import Foundation
import UIKit

class Styling {
    
    static func styleTextField(_ textfield:UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = #colorLiteral(red: 0.583615303, green: 0.583615303, blue: 0.583615303, alpha: 1)
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        textfield.textColor = UIColor.init(red: 15, green: 107, blue: 99, alpha: 1)
        textfield.tintColor =  UIColor.init(red: 15, green: 107, blue: 99, alpha: 1)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        button.backgroundColor = UIColor.init(red: 15/255, green: 107/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.583615303, green: 0.583615303, blue: 0.583615303, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
}
