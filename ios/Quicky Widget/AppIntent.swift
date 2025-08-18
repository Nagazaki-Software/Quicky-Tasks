//
//  AppIntent.swift
//  Quicky Widget
//
//  Created by Enzo Godoy on 14/08/2025.
//

#if canImport(WidgetKit) && canImport(AppIntents)

import Foundation
import WidgetKit
import AppIntents

// MARK: - Intent de configuração do Widget
// Disponível em iOS 16.0+ e seguro para extensão.
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

// MARK: - AppIntent com perform() (extension-safe)
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Executes a simple action for the Quicky widget.")

    @Parameter(title: "Message")
    var message: String?

    // Alguns toolchains pedem a disponibilidade também no método.
    @available(iOS 16.0, *)
    @available(iOSApplicationExtension 16.0, *)
    @MainActor
    func perform() async throws -> some IntentResult {
        // Sua lógica aqui (não use APIs proibidas em extensão)
        return .result()
    }
}

#endif
