//
//  ProductListViewModel.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import SwiftUI
import Combine

class ProductListViewModel: ObservableObject{
    
    @Published private(set) var products: [Product] = []
    
    private var cancelBag = Set<AnyCancellable>()

    let api = API()
    
    init(){
        
        loadProducts()
    }
    
    func loadProducts(){
        
        self.api.getProducts(page: 0){[weak self] errorMessage, products in
            DispatchQueue.main.async {
                self?.products = products?.products ?? []
            }
        }
    }
}
