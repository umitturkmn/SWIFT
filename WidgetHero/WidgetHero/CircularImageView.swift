//
//  CircularImageView.swift
//  WidgetHero
//
//  Created by Ümit Türkmen on 5.03.2024.
//

import SwiftUI

struct CircularImageView: View {
    var image : Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red,lineWidth: 10))
            .shadow(radius: 30)
    }
}

#Preview {
    CircularImageView(image: Image("batman"))
}
