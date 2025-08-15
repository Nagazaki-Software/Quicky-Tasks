import UIKit
import Flutter
import BraintreeCore // <- v6: use o módulo Core para BTAppContextSwitcher

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // 🔹 Retorno de app/browser (Venmo, PayPal nativo, etc) — v6:
  //     use o SINGLETON e o método handleOpen(url)
  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {

    // Não precisa checar scheme; deixa o SDK decidir se a URL é dele
    if BTAppContextSwitcher.sharedInstance.handleOpen(url) {
      return true
    }

    // Deixa Flutter/terceiros tentarem
    return super.application(app, open: url, options: options)
  }
}
