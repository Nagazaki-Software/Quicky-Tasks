#if false
// AppIntent.swift DESATIVADO para iOS 16
// Habilite novamente quando migrar o widget para iOS 17+

import Foundation
import WidgetKit
import AppIntents

@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct QuickyActionIntent: AppIntent {
    static var title: LocalizedStringResource = "Quicky Action"
    static var description = IntentDescription("Executes a simple action for the Quicky widget.")

    @Parameter(title: "Message")
    var message: String?

    @MainActor
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
#endif
