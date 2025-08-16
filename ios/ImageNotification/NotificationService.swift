import UserNotifications
import Foundation

final class NotificationService: UNNotificationServiceExtension {

  private var contentHandler: ((UNNotificationContent) -> Void)?
  private var bestAttemptContent: UNMutableNotificationContent?

  private let possibleImageKeys = [
    "image", "picture", "imageUrl", "imageURL", "attachment-url",
    "fcm_options.image", "aps.alert.image"
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

    if let url = extractImageURL(from: request.content.userInfo) {
      downloadImage(at: url) { fileURL in
        if let fileURL = fileURL,
           let attachment = try? UNNotificationAttachment(identifier: "image", url: fileURL) {
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
    for key in possibleImageKeys {
      if let value = userInfo[key] as? String, let url = URL(string: value) { return url }
    }
    if let apns = userInfo["apns"] as? [String: Any],
       let fcm = apns["fcm_options"] as? [String: Any],
       let image = fcm["image"] as? String,
       let url = URL(string: image) { return url }
    if let data = userInfo["data"] as? [String: Any] {
      for key in possibleImageKeys {
        if let value = data[key] as? String, let url = URL(string: value) { return url }
      }
    }
    if let custom = userInfo["custom"] as? [String: Any] {
      for key in possibleImageKeys {
        if let value = custom[key] as? String, let url = URL(string: value) { return url }
      }
    }
    return nil
  }

  private func downloadImage(at url: URL, completion: @escaping (URL?) -> Void) {
    let cfg = URLSessionConfiguration.ephemeral
    cfg.timeoutIntervalForRequest = 10
    cfg.timeoutIntervalForResource = 15
    let session = URLSession(configuration: cfg)

    session.dataTask(with: url) { data, _, _ in
      guard let data = data else { completion(nil); return }
      let tmp = URL(fileURLWithPath: NSTemporaryDirectory())
      let ext = url.pathExtension.isEmpty ? "jpg" : url.pathExtension
      let fileURL = tmp.appendingPathComponent("notif_image.\(ext)")
      do { try data.write(to: fileURL, options: .atomic); completion(fileURL) }
      catch { completion(nil) }
    }.resume()
  }
}
