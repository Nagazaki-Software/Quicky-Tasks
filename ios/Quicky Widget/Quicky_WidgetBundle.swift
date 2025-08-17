//
//  Quicky_WidgetBundle.swift
//  Quicky Widget
//
//  Created by Enzo Godoy on 14/08/2025.
//

import WidgetKit
import SwiftUI

#if canImport(ActivityKit)
import ActivityKit
#endif

@main
@available(iOSApplicationExtension 16.0, *)
struct Quicky_WidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        // Widget “normal” disponível a partir do iOS 16.0 em extensão
        Quicky_Widget()

        // Live Activity só se o SDK tiver ActivityKit e o SO for 16.1+
        #if canImport(ActivityKit)
        if #available(iOSApplicationExtension 16.1, *) {
            Quicky_WidgetLiveActivity()
        }
        #endif
    }
}

