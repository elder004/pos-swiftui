//
//  Decimal+Extensions.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import Foundation

extension Decimal {
    
    func asCurrency() -> String? {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber)
    }
    
    func asRating() -> String? {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1        
        return formatter.string(from: self as NSNumber)
    }
}
