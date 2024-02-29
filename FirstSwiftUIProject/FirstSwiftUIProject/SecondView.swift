//
//  SecondView.swift
//  FirstSwiftUIProject
//
//  Created by Ümit Türkmen on 29.02.2024.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("selim").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width * 0.8,height: UIScreen.main.bounds.width * 1)
    
    }
}

#Preview {
    SecondView()
}
