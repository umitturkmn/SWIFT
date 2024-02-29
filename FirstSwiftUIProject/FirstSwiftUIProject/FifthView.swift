//
//  FifthView.swift
//  FirstSwiftUIProject
//
//  Created by Ümit Türkmen on 29.02.2024.
//

import SwiftUI

struct FifthView: View {
    
    @State var myName = "Ümit"
    var body: some View {
        Text(myName)
        TextField("placeholder", text: $myName)
    }
}

#Preview {
    FifthView()
}
