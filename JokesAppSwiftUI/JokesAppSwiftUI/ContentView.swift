//
//  ContentView.swift
//  JokesAppSwiftUI
//
//  Created by Ümit Türkmen on 8.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        NavigationStack{
            List(jokesVM.jokes) { element in
                Text(element.joke)
            }
                .navigationTitle(Text("Jokes"))
                .frame(alignment: .center)
                .preferredColorScheme(.light)
                .font(.title3)
                .foregroundStyle(.orange)
        }
    }
  
}

#Preview {
    ContentView()
}
