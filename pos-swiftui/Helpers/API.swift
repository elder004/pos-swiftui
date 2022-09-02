//
//  API.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import Foundation
import Alamofire

class API {
    
    func getProducts(page: Int = 1, completion: @escaping (_ error: String?, _ result: ProductsResult?) -> ()){
        
        if let url = URL(string: Constants.baseUrl+Constants.searchEndpoint) {
         
            AF.request(
                url,
                method: .get,
                parameters: [
                    "page": page
                ],
                encoder: .urlEncodedForm).responseDecodable(of: ProductsResult.self) { response in
                    
                    do {
                        let products = try response.result.get()
                        completion(nil, products)
                    }catch let error{
                        completion(error.localizedDescription, nil)
                    }
                }
            
        }else{
            completion("Invalid URL", nil)
        }
    }
}
