// ios/Quicky Widget/AppIntent.swift

#if canImport(WidgetKit) && canImport(AppIntents)
import WidgetKit
import AppIntents

// Intent de configuração do Widget (não precisa de perform())
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("Quicky widget configuration.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

// (Opcional) Se quiser manter uma action, deixe o perform mais “simples” possível
@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Simple action for the widget.")

    @MainActor
    func perform() async throws -> some IntentResult {
        // Nada que exija abrir app aqui; apenas finalize.
        return .result()
    }
}
#endif
