import UIKit
import Flutter

// Funciona com CocoaPods (módulo "Braintree") e com SPM (módulo "BraintreeCore")
#if canImport(BraintreeCore)
import BraintreeCore
#elseif canImport(Braintree)
import Braintree
#endif

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Retorno de app/browser (Venmo/PayPal nativo) — Braintree v6
  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {

    // Só compila este bloco se algum módulo do Braintree está disponível
    #if canImport(BraintreeCore) || canImport(Braintree)
    if BTAppContextSwitcher.sharedInstance.handleOpen(url) {
      return true
    }
    #endif

    return super.application(app, open: url, options: options)
  }
}
