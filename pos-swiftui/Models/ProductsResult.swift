//
//  ProductsResult.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import Foundation

struct ProductsResult: Decodable {
    
    var products: [Product]
    var currentPage: Int
    var pageSize: Int
    var totalResults: Int
    var pageCount: Int
}
