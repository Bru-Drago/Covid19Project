//
//  Extensions.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

extension String {
    var dateFormat: String {
          let formatter = DateFormatter()
          formatter.locale = Locale(identifier: "pt_br")
          formatter.dateFormat = "dd/MM/YYYY"
          return formatter.string(from: Date())
      }
}

extension Int {
    var numberFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_br")
        return formatter.string(from: NSNumber(value: self))!
    }
}
