import WidgetKit
import SwiftUI

// Modelo de dados que será utilizado no widget
struct ProfileData: TimelineEntry {
    let date: Date
    let displayName: String
    let balance: String
    let nextTask: String
    let rating: String
}

// Provê os dados do widget
struct Provider: TimelineProvider {
    
    // Função para retornar dados de exemplo enquanto o widget está sendo carregado
    func placeholder(in context: Context) -> ProfileData {
        return ProfileData(date: Date(), displayName: "John Doe", balance: "$20", nextTask: "Complete Task", rating: "⭐⭐⭐⭐")
    }

    // Função para fornecer um snapshot para o widget (geralmente para mostrar dados rápidos quando o widget é carregado pela primeira vez)
    func getSnapshot(in context: Context, completion: @escaping (ProfileData) -> Void) {
        let entry = ProfileData(date: Date(), displayName: "John Doe", balance: "$20", nextTask: "Complete Task", rating: "⭐⭐⭐⭐")
        completion(entry)
    }

    // Função para fornecer o Timeline do widget (ou seja, os dados reais que serão atualizados periodicamente)
    func getTimeline(in context: Context, completion: @escaping (Timeline<ProfileData>) -> Void) {
        
        // Gera uma série de entradas para o widget, aqui apenas uma como exemplo
        var entries: [ProfileData] = []
        
        let currentDate = Date()
        for offset in 0..<5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: offset * 30, to: currentDate)!
            
            // Criar um entry com dados que podem ser dinâmicos, aqui usamos dados estáticos
            let entry = ProfileData(date: entryDate, displayName: "John Doe", balance: "$20", nextTask: "Complete Task", rating: "⭐⭐⭐⭐")
            entries.append(entry)
        }

        // Criar o Timeline com os dados
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
