//
//  HeroWidgetBundle.swift
//  HeroWidget
//
//  Created by Ümit Türkmen on 5.03.2024.
//

import WidgetKit
import SwiftUI

@main
struct HeroWidgetBundle: WidgetBundle {
    var body: some Widget {
        HeroWidget()
        HeroWidgetLiveActivity()
    }
}
