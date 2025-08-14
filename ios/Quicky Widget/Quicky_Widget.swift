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

    func getSnapshot(in context: Context, completion: @escaping (UserEntry) -> ()) {
        completion(loadEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<UserEntry>) -> ()) {
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

struct Quicky_WidgetEntryView : View {
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
                Text("Saldo: \(entry.saldo)")
                    .font(.caption)
                Text("Próxima tarefa: \(entry.nextTask)")
                    .font(.caption2)
                Text("Rating: \(entry.rating)")
                    .font(.caption2)
            }
        }
        .padding()
    }
}

struct Quicky_Widget: Widget {
    let kind: String = "Quicky_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Quicky_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Quicky")
        .description("Mostra informações do usuário.")
    }
}

#Preview(as: .systemSmall) {
    Quicky_Widget()
} timeline: {
    UserEntry(date: .now, displayName: "", photoUrl: nil, saldo: "0", nextTask: "", rating: "")
}
