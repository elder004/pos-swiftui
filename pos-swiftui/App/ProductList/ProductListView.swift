//
//  ProductListView.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject var viewModel: ProductListViewModel = ProductListViewModel()
    
    var body: some View {
    
        NavigationView {
            ZStack{
                if viewModel.products.count > 0 {
                    List(viewModel.products.indices, id: \.self) { index in
                        NavigationLink(
                            destination: ProductListView()) {
                                productRow(product: viewModel.products[index])
                        }
                            .onAppear {
                                //TODO fetch more when last appears
                            }
                    }
                } else {
                    Text("No products found.")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Products")
        }
    }
    
    func productRow(product: Product) -> some View {
        
        VStack{
            HStack{
                AsyncImage(url: URL(string: product.productImage ?? "")){ image in
                    image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 100)
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }.frame(width: 80, height: 100)
                VStack {
                Text(product.productName ?? "")
                    .infinityLeading()
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
