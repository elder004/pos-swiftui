//
//  ProductDetailView.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    var scale: GestureState = .init(initialValue: 1.0)
    
    var product: Product
    
    init(product: Product){
        self.product = product
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 8){
                ThumbView(url: product.productImage ?? "", width: .infinity, height: 200)
                Text(product.productName ?? "")
                    .header()
                    .infinityLeading()
                
                if let infoTitle = product.coolbluesChoiceInformationTitle {
                    Text("\"\(infoTitle)\"")
                        .italic()
                        .subtitle()
                        .infinityTrailing()
                }
                Spacer()
                HStack{
                    Text(product.salesPriceIncVat?.asCurrency() ?? "")
                        .money()
                        .infinityLeading()
                    Spacer()
                    if let rating = product.reviewInformation?.reviewSummary?.reviewAverage{
                        RatingView(rating: rating)
                    }
                }
                Spacer()
                ForEach.init(product.USPs ?? [], id: \.self) { text in 
                    Text(text)
                        .subtitle()
                        .infinityLeading()
                }
                
                if(product.nextDayDelivery ?? false){
                    Spacer()
                    Text("Available for Next Day Delivery")
                        .title()
                        .infinityLeading()
                }
            }
        }
        .padding(16)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(product.productName ?? "")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product())
    }
}
