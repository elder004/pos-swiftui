//
//  APIMock.swift
//  pos-swiftuiTests
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import UIKit
@testable import pos_swiftui

class APIMock: APIProtocol {
    
    public var shouldError = false
    public var dummyResult: ProductsResult!
    
    func getProducts(page: Int, completion: @escaping (String?, ProductsResult?) -> ()) {
        dummyResult = ProductsResult(
            products: [
                Product(productId: 123, productName: "Product Name")
            ], currentPage: 1, pageSize: 1, totalResults: 1, pageCount: 1)
        
        if(shouldError){
            completion("Error", nil)
        }else{
            completion(nil, dummyResult)
        }
    }
}
