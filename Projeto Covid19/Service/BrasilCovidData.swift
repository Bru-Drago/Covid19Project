//
//  BrasilCovidData.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

struct StateInfo:Decodable{
    var data : [States]?
}
struct States:Decodable{
    var uid:Int?
    var uf:String?
    var state:String?
    var cases:Int?
    var deaths:Int?
    var suspects:Int?
    var refuses:Int?
    var dateTime:String?
}
