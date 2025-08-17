//
//  Quicky_WidgetLiveActivity.swift
//  Quicky Widget
//
//  Created by Enzo Godoy on 14/08/2025.
//

import WidgetKit
import SwiftUI

#if canImport(ActivityKit)
import ActivityKit

// ActivityKit só em iOS 16.1+ dentro de extensões
@available(iOSApplicationExtension 16.1, *)
struct Quicky_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Estado dinâmico da Live Activity
        var emoji: String
    }

    // Propriedades fixas (imutáveis) da Activity
    var name: String
}

@available(iOSApplicationExtension 16.1, *)
struct Quicky_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Quicky_WidgetAttributes.self) { context in
            // Lock Screen / Banner
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // UI expandida (leading/center/trailing/bottom)
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            // Use HTTPS pra evitar bloqueio de ATS
            .widgetURL(URL(string: "https://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

// MARK: - Previews (Xcode Canvas)
@available(iOSApplicationExtension 16.1, *)
extension Quicky_WidgetAttributes {
    fileprivate static var preview: Quicky_WidgetAttributes {
        Quicky_WidgetAttributes(name: "World")
    }
}

@available(iOSApplicationExtension 16.1, *)
extension Quicky_WidgetAttributes.ContentState {
    fileprivate static var smiley: Quicky_WidgetAttributes.ContentState {
        Quicky_WidgetAttributes.ContentState(emoji: "😀")
    }
    fileprivate static var starEyes: Quicky_WidgetAttributes.ContentState {
        Quicky_WidgetAttributes.ContentState(emoji: "🤩")
    }
}

#endif // canImport(ActivityKit)
