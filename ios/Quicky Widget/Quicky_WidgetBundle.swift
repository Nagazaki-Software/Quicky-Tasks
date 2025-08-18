//  Quicky_WidgetBundle.swift

import WidgetKit
import SwiftUI
#if canImport(ActivityKit)
import ActivityKit
#endif

@main
struct Quicky_WidgetBundle: WidgetBundle {
    var body: some Widget {
        // Widget normal (iOS 14+)
        Quicky_Widget()

        // Live Activity só em 16.1+ e somente se ActivityKit existir
        #if canImport(ActivityKit)
        if #available(iOSApplicationExtension 16.1, *) {
            Quicky_WidgetLiveActivity()
        }
        #endif
    }
}
