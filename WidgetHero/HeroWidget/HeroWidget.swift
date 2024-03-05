//
//  HeroWidget.swift
//  HeroWidget
//
//  Created by Ümit Türkmen on 5.03.2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.umitturkmen.WidgetHero"))
    var heroData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), hero: SuperHero(image: "batman", name: "Batman", realName: "Bruce Wayne"))
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        guard let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData) else {
                fatalError("Failed to decode hero data.")
            }
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            return entry
        
        
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        
        do {
                let hero = try JSONDecoder().decode(SuperHero.self, from: heroData)
                let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
                let timeline = Timeline(entries: [entry], policy: .never)
                return timeline
            } catch {
                // Hata durumunu ele alabilirsiniz
                print("Hata oluştu: \(error)")
                // Uygun bir değer döndürmelisiniz, örneğin boş bir timeline
                return Timeline(entries: [], policy: .never)
            }
        
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let hero: SuperHero
}

struct HeroWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        CircularImageView(image: Image(entry.hero.image))
    }
}

struct HeroWidget: Widget {
    let kind: String = "HeroWidget"

    var body: some WidgetConfiguration {
        
        
        
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            HeroWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}



