//
//  Product.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import Foundation

struct Product: Decodable {
    
    var productId: Int?
    var productName: String?
    var availabilityState: Int?
    var salesPriceIncVat: Decimal?
    var listPriceIncVat: Decimal?
    var listPriceExVat: Decimal?
    var productImage: String?
    var nextDayDelivery: Bool?
    var USPs: [String]?
    var coolbluesChoiceInformationTitle: String?
    var reviewInformation: ReviewInformation?
}

struct ReviewInformation: Decodable {
    
    var reviewSummary: ReviewSummary?
}

struct ReviewSummary: Decodable {
    
    var reviewAverage: Decimal?
    var reviewCount: Int?
}
