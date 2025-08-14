//
//  Quicky_WidgetLiveActivity.swift
//  Quicky Widget
//
//  Created by Enzo Godoy on 14/08/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Quicky_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Quicky_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Quicky_WidgetAttributes.self) { context in
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

extension Quicky_WidgetAttributes {
    fileprivate static var preview: Quicky_WidgetAttributes {
        Quicky_WidgetAttributes(name: "World")
    }
}

extension Quicky_WidgetAttributes.ContentState {
    fileprivate static var smiley: Quicky_WidgetAttributes.ContentState {
        Quicky_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Quicky_WidgetAttributes.ContentState {
         Quicky_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Quicky_WidgetAttributes.preview) {
   Quicky_WidgetLiveActivity()
} contentStates: {
    Quicky_WidgetAttributes.ContentState.smiley
    Quicky_WidgetAttributes.ContentState.starEyes
}
