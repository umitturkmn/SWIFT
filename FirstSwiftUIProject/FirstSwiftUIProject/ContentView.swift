//
//  ContentView.swift
//  FirstSwiftUIProject
//
//  Created by Ümit Türkmen on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, Ümit").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.green).bold()
            Text("Hello World").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.purple).padding(.top)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
