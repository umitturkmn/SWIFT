//
//  Circular.swift
//  CircularSwiftUI
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import SwiftUI

struct Circular: View {
    let lineWidht : CGFloat
    let backgroundColor : Color
    let foregroundColor : Color
    let percentage : Double
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                CircularShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidht))
                    .fill(backgroundColor)
                CircularShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidht))
                    .fill(foregroundColor)
            }
            .animation(.easeIn(duration: 1.0), value: percentage)
            .padding(lineWidht/0.5)
        }
        
        
        
    }
}

#Preview {
    Circular(lineWidht: 10, backgroundColor: .red, foregroundColor: .green, percentage: 50)
}
