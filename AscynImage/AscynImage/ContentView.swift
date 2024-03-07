//
//  ContentView.swift
//  AscynImage
//
//  Created by Ümit Türkmen on 7.03.2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                AsyncImage(url: URL(string: "https://pbs.twimg.com/profile_images/1742150038929727488/2TXm5NiP_400x400.jpg")!) { image in
                                    image.resizable().frame(width: 300, height: 275, alignment: .center)
                                } placeholder: {
                                    ProgressView()
                                }
                List(superHeroArray) {superhero in
                    Text(superhero.name)
                        .font(.title3)
                        .foregroundStyle(.purple)
                    
                }
            }.navigationTitle("SüperHero Book")
            
        }
            
        
    }
}

#Preview {
    ContentView()
}
