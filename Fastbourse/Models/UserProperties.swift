//
//  UserProperties.swift
//  firstApp
//
//  Created by Gandom on 7/25/22.
//
import Foundation

class UserProperties{
    private let token : String
    private let refreshToken : String
    private var ttl : Int
    let email : String?
    private let id : String
    let name : String
    let phoneNumber : String
    var isSessionValid : Bool
    var timer : Timer!
    
    
    init(token: String, refreshToken: String, ttl: Int, email: String?, id: String, name: String, phoneNumber: String) {
        self.token = token
        self.refreshToken = refreshToken
        self.ttl = ttl
        self.email = email
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        isSessionValid = true
        initTimer()
    }
    
    func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    @objc func step(){
        if ttl > 0{
            ttl -= 1
        }else{
            timer.invalidate()
            isSessionValid = false
        }
    }
}
