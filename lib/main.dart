import 'package:flutter/material.dart';
import 'package:flutter_method_channel_example/notification_permission.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<bool> _requestPermission() async {
    bool isGranted = await NotificationPermission.requestPermission();
    return isGranted;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notification Permission"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _requestPermission,
            child: Text("Request Permission"),
          ),
        ),
      ),
    );
  }
}
