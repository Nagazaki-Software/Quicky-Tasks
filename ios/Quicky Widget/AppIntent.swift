//
//  AppIntent.swift
//  Quicky Widget
//
//  Created by Enzo Godoy on 14/08/2025.
//

import Foundation
import WidgetKit
import AppIntents

// MARK: - Intent de configuração do Widget (NÃO precisa de perform())
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

// MARK: - AppIntent minimalista COM perform() (para satisfazer o protocolo)
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Executes a simple action for the Quicky widget.")

    // Parâmetro opcional (não precisa retornar valor)
    @Parameter(title: "Message")
    var message: String?

    // Alguns toolchains só ficam felizes se o método TAMBÉM tiver @available explícito.
    @available(iOS 16.0, *)
    @available(iOSApplicationExtension 16.0, *)
    @MainActor
    func perform() async throws -> some IntentResult {
        // Não retorna valor, só indica sucesso -> evita exigências de ReturnsValue
        return .result()
    }
}
