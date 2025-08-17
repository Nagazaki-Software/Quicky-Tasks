//
//  AppIntent.swift
//  Quicky Widget
//
//  Created by Enzo Godoy on 14/08/2025.
//

import Foundation
import WidgetKit
import AppIntents

// MARK: - Intent de configuração do Widget (iOS 16.0+ em extensão)
// Não precisa de perform(), é só para configurar o widget.
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // Exemplo de parâmetro configurável
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

// MARK: - Intent de ação (AppIntent "normal") com perform()
// Útil para App Shortcuts / ações disparadas pelo widget.
// Colocamos @available para garantir que está liberado em extensões no iOS 16.0+.
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Executes a simple action for the Quicky widget.")

    // Parâmetro de exemplo
    @Parameter(title: "Message")
    var message: String?

    // O perform() precisa estar disponível em extensões; por isso a anotação de cima.
    @MainActor
    func perform() async throws -> some IntentResult {
        // Faça aqui o que a ação precisa (atualizar estado, logar evento, etc.)
        // Mantemos simples para não brigar com as restrições de extensão.
        let output = message?.isEmpty == false ? message! : "OK"
        return .result(value: output)
    }
}
