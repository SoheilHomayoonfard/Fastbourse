//
//  Styling.swift
//  Fastbourse
//
//  Created by Gandom on 7/17/22.
//
import Foundation
import UIKit

class Styling {
    
    static func styleTextField(_ textfield:UITextField) {
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = #colorLiteral(red: 0.8382223845, green: 0.8382223845, blue: 0.8382223248, alpha: 1)
    }
    
    static func styleFilledButton(_ button:UIButton) {
        button.backgroundColor = UIColor.init(red: 15/255, green: 107/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        button.layer.borderWidth = 0.7
        button.layer.cornerRadius = 5
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    static func ColorizeText(textToColorize:String,label: UILabel) {
        let color = UIColor.init(cgColor: #colorLiteral(red: 0, green: 0.4677459002, blue: 1, alpha: 1));
        let attrsString =  NSMutableAttributedString(string:label.text!);
        let range = (label.text! as NSString).range(of: textToColorize)
        if (range.length > 0) {
            attrsString.addAttribute(NSAttributedString.Key.foregroundColor,value:color,range:range)
        }
        label.attributedText = attrsString
    }
    
    static func setFontForButton(textToSet:String,button:UIButton){
        let newFont = UIFont.init(name: "IRANSansXFaNum-Bold" , size: 13)
        button.setTitle(textToSet, for: .normal)
    }
}
