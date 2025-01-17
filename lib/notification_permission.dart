import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationPermission {
  static const _channel = MethodChannel('notification_permission');

  static Future<bool> requestPermission() async {
    try {
      final bool result = await _channel.invokeMethod('requestPermission');
      return result;
    } on PlatformException catch (e) {
      debugPrint("Failed to request notification permission: '${e.message}'.");
      return false;
    }
  }
}
