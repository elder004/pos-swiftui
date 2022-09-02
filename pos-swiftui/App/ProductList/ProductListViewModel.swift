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
    @Published var isLoading = true
    @Published var errorMessage = String()
    @Published var showError = false
    
    let lastVisibleRow: PassthroughSubject<Int, Never> = .init()
    
    let api = API()
    var page = 1
    var totalPages = 1
    
    private var cancelBag = Set<AnyCancellable>()
    
    init(){
        lastVisibleRow
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink(receiveValue: {[weak self] value in
                guard let self = self else {return}
                if((value == self.products.count - 1) && self.page < self.totalPages){
                    self.page += 1
                    self.loadProducts(reset: false)
                }
                
            }).store(in: &cancelBag)
    }
    
    func loadProducts(reset: Bool = true){
        
        isLoading = true
        if(reset){
            page = 1
            totalPages = 1
            products.removeAll()
        }
        
        self.api.getProducts(page: page){[weak self] errorMessage, products in
            DispatchQueue.main.async {
                
                self?.isLoading = false
                
                if let errorMessage = errorMessage {
                    self?.errorMessage = errorMessage
                    self?.showError = true
                }else{
                    self?.products.append(contentsOf: products?.products ?? [])
                    self?.page = products?.currentPage ?? 1
                    self?.totalPages = products?.pageCount ?? 1
                }
            }
        }
    }
}
