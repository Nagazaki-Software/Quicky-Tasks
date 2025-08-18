import WidgetKit
import SwiftUI

struct UserEntry: TimelineEntry {
    let date: Date
    let displayName: String
    let photoUrl: URL?
    let saldo: String
    let nextTask: String
    let rating: String
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> UserEntry {
        UserEntry(
            date: Date(),
            displayName: "Usuário",
            photoUrl: nil,
            saldo: "0",
            nextTask: "—",
            rating: "—"
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (UserEntry) -> ()) {
        completion(loadEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<UserEntry>) -> ()) {
        let entry = loadEntry()
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        completion(Timeline(entries: [entry], policy: .after(nextUpdate)))
    }

    private func loadEntry() -> UserEntry {
        // App Group CORRETO
        let defaults = UserDefaults(suiteName: "group.com.nagazakisoftware.quick")
        let displayName = defaults?.string(forKey: "display_name") ?? ""
        let photoUrl = defaults?.string(forKey: "photo_url").flatMap { URL(string: $0) }
        let saldo = defaults?.string(forKey: "saldo") ?? ""
        let nextTask = defaults?.string(forKey: "nexttask") ?? ""
        let rating = defaults?.string(forKey: "rating") ?? ""
        return UserEntry(
            date: Date(),
            displayName: displayName,
            photoUrl: photoUrl,
            saldo: saldo,
            nextTask: nextTask,
            rating: rating
        )
    }
}

struct Quicky_WidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        // O toque abre o app
        let deeplink = URL(string: "quicky://open")!

        // OBS: .widgetURL é suportado desde iOS 14, mas é um modifier da VIEW,
        // não da configuração.
        content
            .widgetURL(deeplink)
            .padding()
    }

    @ViewBuilder
    private var content: some View {
        HStack(alignment: .center, spacing: 8) {
            // iOS 14 não tem AsyncImage — mostramos placeholder.
            if let url = entry.photoUrl {
                if #available(iOS 15.0, *) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray.opacity(0.2)
                    }
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 48, height: 48)
                }
            } else {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 48, height: 48)
            }

            VStack(alignment: .leading, spacing: 2) {
                if !entry.displayName.isEmpty {
                    Text(entry.displayName)
                        .font(.headline)
                        .lineLimit(1)
                }
                if !entry.saldo.isEmpty {
                    Text("Saldo: \(entry.saldo)")
                        .font(.caption)
                        .lineLimit(1)
                }
                if !entry.nextTask.isEmpty {
                    Text("Próxima tarefa: \(entry.nextTask)")
                        .font(.caption2)
                        .lineLimit(1)
                }
                if !entry.rating.isEmpty {
                    Text("Rating: \(entry.rating)")
                        .font(.caption2)
                        .lineLimit(1)
                }
            }
            Spacer(minLength: 0)
        }
    }
}

@main
struct Quicky_Widget: Widget {
    let kind: String = "Quicky_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Quicky_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Quicky")
        .description("Mostra informações do usuário.")
        // Nada de .containerBackground(for: .widget) (iOS 17 only)
    }
}
