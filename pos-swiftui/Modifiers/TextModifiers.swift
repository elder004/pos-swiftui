//
//  TextModifiers.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import SwiftUI

struct TextTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.system(size: 20.0))
            .foregroundColor(.primary)
    }
}

struct TextSubtitle: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.system(size: 18.0))
            .foregroundColor(.secondary)
    }
}

struct TextMoney: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.system(size: 20.0))
            .foregroundColor(.green)
    }
}

struct TextHeader: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.system(size: 26.0).weight(.semibold))
            .foregroundColor(.primary)
    }
}

struct TextRating: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.system(size: 18).weight(.semibold))
            .foregroundColor(.white)
    }
}

extension Text{
    
    func title() -> some View {
        modifier(TextTitle())
    }
    
    func subtitle() -> some View {
        modifier(TextSubtitle())
    }
    
    func header() -> some View {
        modifier(TextHeader())
    }
    
    func money() -> some View {
        modifier(TextMoney())
    }
    
    func rating() -> some View {
        modifier(TextRating())
    }
}
