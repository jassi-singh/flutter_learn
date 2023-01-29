import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/notification_service.dart';

class NotificationDemo extends StatelessWidget {
  NotificationDemo({Key? key}) : super(key: key);
  final _notificationService = NotificationService();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _notificationService.showNotification(
                title: "TEST",
                body: "First Notification",
              );
            },
            child: const Text("Show Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              _notificationService.showScheduledNotification(
                title: "TEST",
                body: "First Notification",
                scheduledDate: DateTime.now().add(const Duration(seconds: 5)),
              );
            },
            child: const Text("Show Scheduled Notification"),
          ),
        ],
      ),
    );
  }
}
