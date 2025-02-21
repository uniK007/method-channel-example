import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "notification_permission", binaryMessenger: controller.binaryMessenger)

     channel.setMethodCallHandler { (call, result) in
            if call.method == "requestPermission" {
                self.requestNotificationPermission(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        let settingsChannel = FlutterMethodChannel(name: "app_settings",
                                                   binaryMessenger: controller.binaryMessenger)
        settingsChannel.setMethodCallHandler { (call, result) in
            if call.method == "openAppSettings" {
                self.openAppSettings()
                result(nil)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    private func requestNotificationPermission(result: @escaping FlutterResult) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Failed to request permission: \(error)")
                result(false)
            } else {
                result(granted)
            }
        }
    }

    private func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
