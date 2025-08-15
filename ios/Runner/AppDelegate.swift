import UIKit
import Flutter
import Braintree

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // 🔹 Intercepta o retorno do browser/app no 3D Secure ou PayPal
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if url.scheme?.localizedCaseInsensitiveCompare("com.nagazakisoftware.quick.payments") == .orderedSame {
        return BTAppContextSwitcher.handleOpenURL(url)
    }
    return super.application(app, open: url, options: options)
  }
}