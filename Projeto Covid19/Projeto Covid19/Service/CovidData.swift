//
//  CovidData.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

struct CountryInfo:Decodable{
    var data :[Countries]?
}

struct Countries:Decodable{
   
    var country:String?
    var confirmed:Int?
    var cases:Int?
    var deaths:Int?
    var recovered:Int?
    var updatedAt:String?
    
    enum CodingKeys:String ,CodingKey {
        case country
        
        case confirmed
        case cases
        case deaths
        case recovered
        case updatedAt = "updated_at"
    }
    
}


