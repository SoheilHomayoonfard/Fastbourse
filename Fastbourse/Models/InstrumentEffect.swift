//
//  InstrumentEffect.swift
//  firstApp
//
//  Created by Gandom on 7/27/22.
//

import Foundation


struct instrumentEffect: Decodable {
  let effect : Double
  let finalPrice : Int
  let name : String
  let order : Int
  let tseID : Int
    
  enum CodingKeys: String, CodingKey {
    case effect
    case finalPrice = "final_price"
    case name
    case order
    case tseID = "tse_id"
  }
}

protocol Displayable{
    var TitleLabel : String{ get }
    
    var subtitleLabel : String{ get }
}
 

extension instrumentEffect : Displayable {
    var TitleLabel : String{
        name
    }
    var subtitleLabel: String{
        "effect:\(effect) , final price:\(finalPrice) , order:\(order)"
    }
}
