//
//  ProductListView.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import SwiftUI
import Combine

struct ProductListView: View {
    
    @ObservedObject var viewModel: ProductListViewModel
    
    private var cancelBag = Set<AnyCancellable>()
    
    init(viewModel: ProductListViewModel = ProductListViewModel()){
        self.viewModel = viewModel
    }
    
    var body: some View {
    
        NavigationView {
            ZStack{
                if viewModel.products.count > 0 {
                    List(viewModel.products.indices, id: \.self) { index in
                        NavigationLink(
                            destination: ProductDetailView(product: viewModel.products[index])) {
                                productRow(product: viewModel.products[index])
                        }
                            .onAppear {
                                if(index == viewModel.products.count - 1){
                                    viewModel.lastVisibleRow.send(index)
                                }
                            }
                    }.tag("productList")
                } else if !viewModel.isLoading{
                    Text("No products found.")
                        .tag("textNotFound")
                }
                if(viewModel.isLoading){
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            .alert(viewModel.errorMessage, isPresented: $viewModel.showError) {
                Button("Try again", role: .cancel) {
                    viewModel.showError = false
                    viewModel.loadProducts()
                }
            }
            .navigationTitle("Products")
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
    
    func productRow(product: Product) -> some View {
        
        VStack{
            HStack(alignment: .top){
                ThumbView(url: product.productImage ?? "", width: 80, height: 100)
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.productName ?? "")
                        .title()
                        .infinityLeading()
                        .tag("textProductName")
                    Text(product.salesPriceIncVat?.asCurrency() ?? "")
                        .money()
                        .infinityLeading()
                        .tag("textProductPrice")
                }
                if let rating = product.reviewInformation?.reviewSummary?.reviewAverage{
                    RatingView(rating: rating)
                        .tag("productRating")
                }
            }
        }
    }
}


struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
