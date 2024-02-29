//
//  ContentView.swift
//  FavoriteBook
//
//  Created by Ümit Türkmen on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(myFavorites) {
                    favorite in Section(header: Text(favorite.title)) {
                        ForEach(favorite.elements) {
                            element in
                            NavigationLink(destination: DetailsView(choosenFavElement: element)) {
                                Text(element.name)
                            }
                            
                        }
                    }
                }
            }.navigationBarTitle("Favori Kitabım")
        }
        
    }
}

#Preview {
    ContentView()
}
