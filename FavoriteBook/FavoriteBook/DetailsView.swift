//
//  DetailsView.swift
//  FavoriteBook
//
//  Created by Ümit Türkmen on 29.02.2024.
//

import SwiftUI

struct DetailsView: View {
    
    var choosenFavElement : FavoriteElements
    
    var body: some View {
        VStack {
            Image(choosenFavElement.imageName).resizable().aspectRatio(contentMode: .fit)
            Text(choosenFavElement.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .padding()
            Text(choosenFavElement.description)
                .font(.headline)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    DetailsView(choosenFavElement: ottoman)
}
