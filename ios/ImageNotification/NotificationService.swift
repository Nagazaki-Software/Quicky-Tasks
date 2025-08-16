// ios/ImageNotification/NotificationService.swift
import UserNotifications
import Foundation

final class NotificationService: UNNotificationServiceExtension {

  private var contentHandler: ((UNNotificationContent) -> Void)?
  private var bestAttemptContent: UNMutableNotificationContent?

  // Chaves que vamos tentar procurar no payload para a URL da imagem
  private let possibleImageKeys = [
    "image",                       // comum em muitos backends
    "picture",                     // alguns usam essa
    "imageUrl", "imageURL",        // variantes
    "attachment-url",              // padrão legado
    // Algumas integrações FCM/APNs podem mandar em dicionários:
    "fcm_options.image",           // apns > fcm_options > image
    "aps.alert.image"              // raríssimo, mas tentamos
  ]

  override func didReceive(
    _ request: UNNotificationRequest,
    with contentHandler: @escaping (UNNotificationContent) -> Void
  ) {
    self.contentHandler = contentHandler
    self.bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

    guard let bestAttemptContent = bestAttemptContent else {
      contentHandler(request.content)
      return
    }

    // Se encontrar URL de imagem no payload, baixa e anexa; senão, entrega como veio
    if let url = extractImageURL(from: request.content.userInfo) {
      downloadImage(at: url) { fileURL in
        if let fileURL = fileURL, let attachment = try? UNNotificationAttachment(identifier: "image", url: fileURL) {
          bestAttemptContent.attachments = [attachment]
        }
        contentHandler(bestAttemptContent)
      }
    } else {
      contentHandler(bestAttemptContent)
    }
  }

  override func serviceExtensionTimeWillExpire() {
    if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
      contentHandler(bestAttemptContent)
    }
  }

  // MARK: - Helpers

  private func extractImageURL(from userInfo: [AnyHashable: Any]) -> URL? {
    // 1) Tenta chaves simples no nível raiz
    for key in possibleImageKeys {
      if let value = userInfo[key] as? String, let url = URL(string: value) {
        return url
      }
    }

    // 2) Tenta estruturas aninhadas comuns (apns > fcm_options > image)
    if let apns = userInfo["apns"] as? [String: Any],
       let fcmOptions = apns["fcm_options"] as? [String: Any],
       let image = fcmOptions["image"] as? String,
       let url = URL(string: image) {
      return url
    }

    // 3) Alguns provedores mandam a URL dentro de "data" ou "custom"
    if let data = userInfo["data"] as? [String: Any] {
      for key in possibleImageKeys {
        if let value = data[key] as? String, let url = URL(string: value) {
          return url
        }
      }
    }
    if let custom = userInfo["custom"] as? [String: Any] {
      for key in possibleImageKeys {
        if let value = custom[key] as? String, let url = URL(string: value) {
          return url
        }
      }
    }

    return nil
  }

  private func downloadImage(at url: URL, completion: @escaping (URL?) -> Void) {
    // Baixa de forma simples (com timeout curto) e salva em arquivo temporário
    let config = URLSessionConfiguration.ephemeral
    config.timeoutIntervalForRequest = 10
    config.timeoutIntervalForResource = 15
    let session = URLSession(configuration: config)

    let task = session.dataTask(with: url) { data, _, _ in
      guard let data = data else {
        completion(nil)
        return
      }
      let tmpDir = URL(fileURLWithPath: NSTemporaryDirectory())
      // Use a extensão correta quando possível
      let fileExt = (url.pathExtension.isEmpty ? "jpg" : url.pathExtension)
      let fileURL = tmpDir.appendingPathComponent("notif_image.\(fileExt)")
      do {
        try data.write(to: fileURL, options: .atomic)
        completion(fileURL)
      } catch {
        completion(nil)
      }
    }
    task.resume()
  }
}
