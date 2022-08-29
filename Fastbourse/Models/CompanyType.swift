//
//  CompanyType.swift
//  firstApp
//
//  Created by Gandom on 7/24/22.
//
import Foundation

struct CompanyType : Decodable{
    let bourse : bourseCategory
    let farabourse : farabourseCategory
    
    enum CodingKeys : String, CodingKey {
        case bourse = "bourse"
        case farabourse = "farabourse"
    }
}

struct bourseCategory : Decodable{
    let instrumentEffect : [instrumentEffect]
    let mostVisitedSymbols : [mostVisitedSymbols]
    let selectedIndices : [selectedIndices]
    let bourseSummary : bourseSummary
    
    enum CodingKeys : String, CodingKey {
        case instrumentEffect = "instruments_effect"
        case mostVisitedSymbols = "most_visited_symbols"
        case selectedIndices = "selected_indices"
        case bourseSummary = "summary"
    }
    
}

struct farabourseCategory : Decodable{
    let instrumentEffect : [instrumentEffect]
    let mostVisitedSymbols : [mostVisitedSymbols]
    let farabourseSummary : farabourseSummary
    
    enum CodingKeys : String, CodingKey {
        case instrumentEffect = "instruments_effect"
        case mostVisitedSymbols = "most_visited_symbols"
        case farabourseSummary = "summary"
    }
    
}


