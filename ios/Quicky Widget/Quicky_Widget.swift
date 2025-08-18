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
            displayName: "",
            photoUrl: nil,
            saldo: "0",
            nextTask: "",
            rating: ""
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (UserEntry) -> Void) {
        completion(loadEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<UserEntry>) -> Void) {
        let entry = loadEntry()
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        completion(Timeline(entries: [entry], policy: .after(nextUpdate)))
    }

    private func loadEntry() -> UserEntry {
        let defaults = UserDefaults(suiteName: "group.com.quicky")
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
        HStack(alignment: .center) {
            if let url = entry.photoUrl {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(entry.displayName)
                    .font(.headline)
                    .lineLimit(1)
                Text("Saldo: \(entry.saldo)")
                    .font(.caption)
                    .lineLimit(1)
                Text("Próxima tarefa: \(entry.nextTask)")
                    .font(.caption2)
                    .lineLimit(1)
                Text("Rating: \(entry.rating)")
                    .font(.caption2)
                    .lineLimit(1)
            }
        }
        .padding()
    }
}

struct Quicky_Widget: Widget {
    let kind: String = "Quicky_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            // 👉 O toque no widget abre o app pelo URL scheme
            Quicky_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "quicky://open")!)
        }
        .configurationDisplayName("Quicky")
        .description("Mostra informações do usuário.")
        // .supportedFamilies([.systemSmall, .systemMedium, .systemLarge]) // opcional
    }
}
