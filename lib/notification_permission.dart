import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationPermission {
  static const MethodChannel _notificationChannel = MethodChannel('notification_permission');
  static const MethodChannel _settingsChannel = MethodChannel('app_settings');

  static Future<bool> requestPermission() async {
    try {
      final bool result = await _notificationChannel.invokeMethod('requestPermission');
      return result;
    } on PlatformException catch (e) {
      debugPrint("Failed to request notification permission: '${e.message}'.");
      return false;
    }
  }

  static Future<void> openAppSettings() async {
    try {
      await _settingsChannel.invokeMethod('openAppSettings');
    } on PlatformException catch (e) {
      debugPrint("Failed to open app settings: '${e.message}'.");
    }
  }
}
