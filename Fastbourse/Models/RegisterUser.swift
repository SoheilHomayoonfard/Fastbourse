//
//  User.swift
//  firstApp
//
//  Created by Gandom on 7/22/22.
//
import Foundation

struct User :Decodable{
    let token : String
    let refreshToken : String
    let ttl : Int
    let basics : BasicUser
    
    enum CodingKeys : String , CodingKey{
        case token = "access_token"
        case refreshToken = "refresh_token"
        case ttl
        case basics = "user"
    }
}

struct BasicUser : Decodable{
    let email : String?
    let id : String
    let name : String
    let phoneNumber : String
    
    enum CodingKeys : String, CodingKey{
        case email
        case name
        case id
        case phoneNumber = "phone_number"
    }
}

struct RegisterUser{
    static var PhoneNumber : String = ""
    static var Email: String = ""
    static var ActivateValidationTime : Int = 300
    static var AvtivateCode : Int = 13571
    
    init (PhoneNumber phone: String ,Email email: String , ActivateValidationTime activatettl : Int){
        RegisterUser.PhoneNumber = phone
        RegisterUser.Email = email
        RegisterUser.ActivateValidationTime = activatettl
    }
}

struct ActivationValidate : Decodable {
    let ActivateValidationTime : Int
    let PhoneNumber : String
    
    enum CodingKeys : String, CodingKey {
        case ActivateValidationTime = "activate_ttl"
        case PhoneNumber = "phone_number"
    }
}



