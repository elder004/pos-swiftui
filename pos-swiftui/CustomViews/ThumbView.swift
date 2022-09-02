//
//  ThumbView.swift
//  pos-swiftui
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import SwiftUI

struct ThumbView: View {
    
    var url: String
    var width: Double
    var height: Double
    
    init(url: String, width: Double, height: Double) {
        self.url = url
        self.width = width
        self.height = height
    }
    
    var body: some View {
        
        AsyncImage(url: URL(string: url)){ image in
            image
            .resizable()
            .scaledToFit()
            .frame(maxWidth: width, maxHeight: height)
            }
        placeholder: {
            Color.gray.opacity(0.1)
        }
        .frame(maxWidth: width, maxHeight: height)
    }
}

struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView(url: "", width: 10, height: 10)
    }
}
