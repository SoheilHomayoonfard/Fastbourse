//
//  ComapanyCategories.swift
//  firstApp
//
//  Created by Gandom on 7/27/22.
//

import Foundation


struct mostVisitedSymbols: Decodable {
    let companyName : String
    let finalPrice :Int
    let finalPriceChangePercent :Double
    let lastTrade :Int
    let lastTradeChangePercent :Double
    let maximumPrice :Int
    let minimumPrice :Int
    let name :String
    let order :Int
    let quantity :Int
    let tseId :Int
    let value :Int
    let volume :Int
    
  enum CodingKeys: String, CodingKey {
      case companyName = "company_name"
      case finalPrice = "final_price"
      case finalPriceChangePercent = "final_price_change_percent"
      case lastTrade = "last_trade"
      case lastTradeChangePercent = "last_trade_change_percent"
      case maximumPrice = "maximum_price"
      case minimumPrice = "minimum_price"
      case name
      case order
      case quantity
      case tseId = "tse_id"
      case value
      case volume
  }
}



struct selectedIndices :Decodable{
    let amount : Double
    let change :Double
    let changePercent :Double
    let maximum : Double
    let minimum : Double
    let name :String
    let order :Int
    let publishment : String
    
  enum CodingKeys: String, CodingKey {
      case amount
      case change
      case changePercent = "change_percent"
      case maximum
      case minimum
      case name
      case order
      case publishment
  }
}


struct bourseSummary : Decodable {
    let marketValue : Int
    let overallIndex : Double
    let overallIndexChange : Double
    let overallIndexChangePercent : Double
    let overallIndexWight : Double
    let overallIndexWightChange : Double
    let overallIndexWightChangePercent : Double
    let pricesData : String
    let state: String
    let tradesQuantity: Int
    let tradesValue : Int
    let tradesVolume : Int
    
    enum CodingKeys: String, CodingKey {
        case marketValue = "market_value"
        case overallIndex = "overall_index"
        case overallIndexChange = "overall_index_change"
        case overallIndexChangePercent = "overall_index_change_percent"
        case overallIndexWight = "overall_index_weight"
        case overallIndexWightChange = "overall_index_weight_change"
        case overallIndexWightChangePercent = "overall_index_weight_change_percent"
        case pricesData = "prices_data"
        case state = "state"
        case tradesQuantity = "trades_value"
        case tradesValue = "trades_quantity"
        case tradesVolume = "trades_volume"
    }
    
}

struct farabourseSummary : Decodable {
    let baseMarketValue : Int
    let marketValue : Int
    let overallIndex : Double
    let overallIndexChange : Double
    let overallIndexChangePercent : Double
    let pricesData : String
    let state: String
    let tradesQuantity: Int
    let tradesValue : Int
    let tradesVolume : Int
    
    enum CodingKeys: String, CodingKey {
        case baseMarketValue = "base_market_value"
        case marketValue = "market_value"
        case overallIndex = "overall_index"
        case overallIndexChange = "overall_index_change"
        case overallIndexChangePercent = "overall_index_change_percent"
        case pricesData = "prices_data"
        case state = "state"
        case tradesQuantity = "trades_value"
        case tradesValue = "trades_quantity"
        case tradesVolume = "trades_volume"
    }
    
    
    
    
}



