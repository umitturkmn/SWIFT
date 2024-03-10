//
//  ContentView.swift
//  CircularSwiftUI
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var firstCirclePercantage : Double = 0
    var body: some View {
        ZStack{
            Circular(lineWidht: 40, backgroundColor: Color.blue.opacity(0.2), foregroundColor: Color.blue, percentage: firstCirclePercantage)
                .frame(width: 350,height: 350)
                .onTapGesture {
                    if self.firstCirclePercantage == 0 {
                        self.firstCirclePercantage = 25
                    } else if self.firstCirclePercantage == 25 {
                        self.firstCirclePercantage = 50
                    } else if self.firstCirclePercantage == 50 {
                        self.firstCirclePercantage = 75
                    }
                    else if self.firstCirclePercantage == 75 {
                        self.firstCirclePercantage = 100
                    }
                    else if self.firstCirclePercantage == 100 {
                        self.firstCirclePercantage = 0
                    }
                }
            Circular(lineWidht: 20, backgroundColor: Color.red.opacity(0.2), foregroundColor: Color.red, percentage: firstCirclePercantage)
                .frame(width: 350,height: 350)
                .onTapGesture {
                    if self.firstCirclePercantage == 0 {
                        self.firstCirclePercantage = 25
                    } else if self.firstCirclePercantage == 25 {
                        self.firstCirclePercantage = 50
                    } else if self.firstCirclePercantage == 50 {
                        self.firstCirclePercantage = 75
                    }
                    else if self.firstCirclePercantage == 75 {
                        self.firstCirclePercantage = 100
                    }
                    else if self.firstCirclePercantage == 100 {
                        self.firstCirclePercantage = 0
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
