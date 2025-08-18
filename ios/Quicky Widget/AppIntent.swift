//
//  AppIntent.swift
//  Quicky Widget
//

#if canImport(WidgetKit) && canImport(AppIntents) && os(iOS)

import Foundation
import WidgetKit
import AppIntents

// MARK: - Configuração do widget
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

// MARK: - Ação que abre o app
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Abrir Quicky"
    static var description = IntentDescription("Abre o app principal Quicky.")

    @Parameter(title: "Mensagem")
    var message: String?

    @available(iOS 16.0, *)
    @available(iOSApplicationExtension 16.0, *)
    @MainActor
    func perform() async throws -> some IntentResult {
        // Ao tocar, simplesmente abre o app
        return .result(
            opensApp: true
        )
    }
}

#endif
