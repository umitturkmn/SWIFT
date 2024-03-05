//
//  HeroWidgetLiveActivity.swift
//  HeroWidget
//
//  Created by Ümit Türkmen on 5.03.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct HeroWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct HeroWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: HeroWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension HeroWidgetAttributes {
    fileprivate static var preview: HeroWidgetAttributes {
        HeroWidgetAttributes(name: "World")
    }
}

extension HeroWidgetAttributes.ContentState {
    fileprivate static var smiley: HeroWidgetAttributes.ContentState {
        HeroWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: HeroWidgetAttributes.ContentState {
         HeroWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: HeroWidgetAttributes.preview) {
   HeroWidgetLiveActivity()
} contentStates: {
    HeroWidgetAttributes.ContentState.smiley
    HeroWidgetAttributes.ContentState.starEyes
}
