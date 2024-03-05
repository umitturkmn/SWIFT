//
//  HeroView.swift
//  WidgetHero
//
//  Created by Ümit Türkmen on 5.03.2024.
//

import SwiftUI

struct HeroView: View {
    
    let hero: SuperHero
    var body: some View {
        HStack{
            CircularImageView(image: Image(hero.image))
                .frame(width: 100,height: 100,alignment: .center).padding()
            Spacer()
            VStack{
                Text(hero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Text(hero.realName)
                    .fontWeight(.bold)
            }.padding()
            Spacer()
            
        }.frame(width: UIScreen.main.bounds.width,alignment: .center)
        
    }
}

#Preview {
    HeroView(hero: batman)
}
