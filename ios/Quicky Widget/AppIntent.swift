//
//  AppIntent.swift
//  Quicky Widget
//
//  Compile ONLY in the Widget Extension target.
//

#if canImport(WidgetKit)
import WidgetKit
#endif

#if canImport(AppIntents)
import AppIntents

// Disponível a partir do iOS 16 em extensões.
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("Configurações do widget.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Executa uma ação simples do widget.")

    @Parameter(title: "Message")
    var message: String?

    @MainActor
    func perform() async throws -> some IntentResult {
        // ação “no-op” para ser sempre válida
        return .result()
    }
}
#endif
