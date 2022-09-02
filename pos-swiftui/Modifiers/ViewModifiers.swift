//
//  ViewModifiers.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import SwiftUI

struct InfinityLeading: ViewModifier{
    
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension View {
    
    func infinityLeading() -> some View{
        modifier(InfinityLeading())
    }
}
