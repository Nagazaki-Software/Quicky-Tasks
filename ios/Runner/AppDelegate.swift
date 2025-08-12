import UIKit
import Flutter
import BraintreeCore

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Registrar plugins Flutter
    GeneratedPluginRegistrant.register(with: self)
    
    // Configura o esquema da URL para o callback do Braintree PayPal
    BTAppContextSwitcher.setReturnURLScheme("com.nagazakisoftware.quick.payments") // <--- coloque seu CFBundleURLSchemes aqui
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

// Configura o esquema da URL para o callback do Braintree PayPal
  BTAppContextSwitcher.setReturnURLScheme("com.nagazakisoftware.quick.payments") // <--- coloque seu CFBundleURLSchemes aqui
  
  return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}

// Método para tratar a abertura da URL de callback do PayPal/Braintree
override func application(
  _ app: UIApplication,
  open url: URL,
  options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {
  if BTAppContextSwitcher.handleOpenURL(url) {

  // Método para tratar a abertura da URL de callback do PayPal/Braintree
  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    if BTAppContextSwitcher.handleOpenURL(url) {
      return true
    }
    return super.application(app, open: url, options: options)
  }
}
