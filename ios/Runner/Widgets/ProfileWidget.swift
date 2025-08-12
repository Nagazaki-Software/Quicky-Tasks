import WidgetKit
import SwiftUI

// Modelo de dados para o widget (a entrada)
struct ProfileData: TimelineEntry {
    let date: Date
    let displayName: String
    let balance: String
    let nextTask: String
    let rating: String
}

// A visualização do widget
struct ProfileWidgetEntryView: View {
    var entry: ProfileData

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Imagem do Avatar
                Image("ic_avatar") // A imagem do avatar que você adicionou no projeto
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .padding(.leading, 16)

                VStack(alignment: .leading) {
                    // Nome do perfil
                    Text(entry.displayName)
                        .font(.headline)
                    
                    // Informações de "Balance", "Next Task", e "Rating"
                    HStack {
                        VStack {
                            Text("Balance")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(entry.balance)
                                .font(.body)
                                .bold()
                        }
                        VStack {
                            Text("Next Task")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(entry.nextTask)
                                .font(.body)
                                .bold()
                        }
                        VStack {
                            Text("Rating")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(entry.rating)
                                .font(.body)
                                .bold()
                        }
                    }
                    .padding(.top, 8)
                }
                .padding(.leading, 12)
            }
            .padding(.top, 16)
            Spacer()
        }
        .background(Color(hex: "#A58D5A")) // Cor de fundo personalizada
        .cornerRadius(12) // Cantos arredondados
        .padding(16) // Padding externo
    }
}

// Função para criar cor a partir de hexadecimal
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
