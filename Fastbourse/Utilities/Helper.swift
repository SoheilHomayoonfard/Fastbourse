//
//  Helper.swift
//  firstApp
//
//  Created by Gandom on 7/19/22.
//

import Foundation

class Helper {
    
    static func isValidPhoneNumber(_ PhoneNumber: String) -> Bool {
        let regEx = "^09[0-9]{9}$"
        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: PhoneNumber)
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
