//
//  AppIntent.swift
//  Quicky Widget
//
//  Created by Enzo Godoy on 14/08/2025.
//

import Foundation
import WidgetKit
import AppIntents

// ----------------------------------------------------------------------
// FIX universal: fornece um perform() padrão para QUALQUER AppIntent,
// explicitamente disponível em extensões (iOSApplicationExtension 16.0+).
// Isso silencia a exigência do compilador em Configuration intents.
// ----------------------------------------------------------------------
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
extension AppIntent {
    @available(iOS 16.0, *)
    @available(iOSApplicationExtension 16.0, *)
    @MainActor
    public func perform() async throws -> some IntentResult {
        // Resultado vazio (não retorna valor). Intents que precisarem
        // podem sobrescrever normalmente com seu próprio perform().
        return .result()
    }
}

// MARK: - Intent de configuração do Widget (NÃO precisa de perform())
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

// (Opcional) Um AppIntent com perform() próprio, só para demonstração.
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Executes a simple action for the Quicky widget.")

    @Parameter(title: "Message")
    var message: String?

    @available(iOS 16.0, *)
    @available(iOSApplicationExtension 16.0, *)
    @MainActor
    func perform() async throws -> some IntentResult {
        let msg = (message?.isEmpty == false) ? message! : "OK"
        return .result(value: msg)
    }
}
