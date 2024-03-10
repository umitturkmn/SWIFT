//
//  SecondView.swift
//  SwiftUINavigation
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import SwiftUI

struct SecondView: View {
    @State var path: [Dog] = []
    var body: some View {
        
        NavigationStack(path: $path){
            List(dogs) {dog in
                NavigationLink(dog.name,value: dog)
            }.navigationDestination(for: Dog.self) { dog in
                VStack{
                    Text(dog.name)
                    /*
                    Button("Go Back") {
                        self.path = []
                     */
                    Button("Add to Path") {
                        path = [dogs[0],dogs[1]]
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    SecondView()
}
