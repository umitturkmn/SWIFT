//
//  ThirdView.swift
//  FirstSwiftUIProject
//
//  Created by Ümit Türkmen on 29.02.2024.
//

import SwiftUI

struct ThirdView: View {
    let myArray = ["Osman","Murat","Beyazid","Fatih","Selim","Süleyman"]
    var body: some View {
        List(myArray, id: \.self) {
            element in Text(element).font(.largeTitle)
        }
    }
}

#Preview {
    ThirdView()
}
