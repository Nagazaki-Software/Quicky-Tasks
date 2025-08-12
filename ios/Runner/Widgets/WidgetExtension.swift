import WidgetKit
import SwiftUI

@main
struct ProfileWidgetExtension: Widget {
    let kind: String = "ProfileWidgetExtension" // Nome do widget

    var body: some WidgetConfiguration {
        // Usando uma configuração estática para o widget
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ProfileWidgetEntryView(entry: entry) // A view que exibe os dados
        }
        .configurationDisplayName("Profile Widget")
        .description("Displays profile information like balance, next task, and rating.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge]) // Tipos de widget suportados
    }
}
