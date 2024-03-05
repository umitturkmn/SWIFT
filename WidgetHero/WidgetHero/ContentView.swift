//
//  ContentView.swift
//  WidgetHero
//
//  Created by Ümit Türkmen on 5.03.2024.
//

import WidgetKit
import SwiftUI

let superHeroArray = [superman,batman,ironman]

struct ContentView: View {
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.umitturkmen.WidgetHero"))
    var heroData : Data = Data()
    
    var body: some View {
        VStack {
            ForEach(superHeroArray){hero in
                HeroView(hero: hero).onTapGesture {
                    saveToDefaults(hero: hero)
                }
                
            }
        }
    }
    func saveToDefaults(hero : SuperHero){
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData
            print(hero.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "HeroWidget")
            
        }
    }
}

#Preview {
    ContentView()
}
