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

struct InfinityTrailing: ViewModifier{
    
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, alignment: .trailing)
    }
}

extension View {
    
    func infinityLeading() -> some View{
        modifier(InfinityLeading())
    }
    
    func infinityTrailing() -> some View{
        modifier(InfinityTrailing())
    }
}
