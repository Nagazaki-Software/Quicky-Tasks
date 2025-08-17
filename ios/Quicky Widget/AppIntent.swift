//
//  AppIntent.swift
//  Quicky Widget
//
//  Created by Enzo Godoy on 14/08/2025.
//

// Compile este arquivo SOMENTE quando estiver construindo a Widget Extension.
// O Xcode define WIDGET_EXTENSION para targets de extensão.
#if canImport(WidgetKit) && canImport(AppIntents) && WIDGET_EXTENSION

import Foundation
import WidgetKit
import AppIntents

// MARK: - Intent de configuração do Widget (não precisa de perform())
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

// MARK: - AppIntent com perform() (disponível para extensões)
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Executes a simple action for the Quicky widget.")

    @Parameter(title: "Message")
    var message: String?

    // Alguns toolchains exigem a disponibilidade no MÉTODO também.
    @available(iOS 16.0, *)
    @available(iOSApplicationExtension 16.0, *)
    @MainActor
    func perform() async throws -> some IntentResult {
        return .result() // retorno vazio é o mais compatível
    }
}

#endif
