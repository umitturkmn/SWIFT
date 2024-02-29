//
//  FourthView.swift
//  FirstSwiftUIProject
//
//  Created by Ümit Türkmen on 29.02.2024.
//

import SwiftUI

struct FourthView: View {
    
    @State var myName = "Ümit Türkmen"
    var body: some View {
        VStack{
            Text(myName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .lineLimit(1)
                .padding(.bottom)
                
            
            Button {
                if(myName == "Ümit Türkmen") {
                    self.myName = "Adamdır."
                } else {
                    self.myName = "Ümit Türkmen"
                }
            } label: {
                Text("My Button")
            }

        }
        
    }
}

#Preview {
    FourthView()
}
