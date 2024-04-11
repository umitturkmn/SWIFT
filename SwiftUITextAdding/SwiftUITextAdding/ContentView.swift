//
//  ContentView.swift
//  SwiftUITextAdding
//
//  Created by Ümit Türkmen on 10.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            
            Text("Merhaba Ümit Türkmen!")
                .background(
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.yellow]), startPoint: .trailing, endPoint: .leading)
                        )
                        .frame(width: 200, height: 200)
                )
                .background(
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .trailing, endPoint: .leading)
                        )
                        .frame(width: 300, height: 300)
                )

        }.padding(10)
    }
}

#Preview {
    ContentView()
}
