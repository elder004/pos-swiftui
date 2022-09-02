//
//  Functions.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import Foundation
import SwiftUI

class Functions{
    
    static func getColorForRating(rating: Decimal) -> Color {
        
        if(rating >= 9){
            return .green
        }else if (rating >= 6){
            return .orange
        }
        
        return .red
    }
}
