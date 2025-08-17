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
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

// MARK: - AppIntent "normal" com perform() (para satisfazer o protocolo AppIntent)
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Executes a simple action for the Quicky widget.")

    @Parameter(title: "Message")
    var message: String?

    // O perform() precisa estar disponível em extensões 16.0+
    @MainActor
    func perform() async throws -> some IntentResult {
        let output = (message?.isEmpty == false) ? message! : "OK"
        return .result(value: output)
    }
}
