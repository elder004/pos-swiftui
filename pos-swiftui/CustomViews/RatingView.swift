//
//  RatingView.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import SwiftUI

struct RatingView: View {
    
    var rating: Decimal
    
    init(rating: Decimal){
        self.rating = rating
    }
    
    var body: some View {
        
        HStack{
            Text(rating.asRating() ?? "")
                .rating()
                .tag("textRating")
        }
        .padding(4)
        .background(Functions.getColorForRating(rating: rating))
        .tag("ratingViewStack")
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 9)
    }
}
