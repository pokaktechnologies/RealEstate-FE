import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<String> notifications = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding:
                const EdgeInsets.all(12.0), // Adjust padding to center better
            child: Image.asset(AppAssets.arrowbackIcon),
          ),
        ),
        backgroundColor: AppColors.white,
      ),
      body:
          notifications.isEmpty ? _buildEmptyState() : _buildNotificationList(),
    );
  }

  // Empty notification UI
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.nonotification,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            "No Notification Here",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.mediumGray),
          ),
          const SizedBox(height: 5),
          const Text(
            "There is no notification to show right now ",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.mediumGray),
          ),
        ],
      ),
    );
  }

  // Notification list UI
  Widget _buildNotificationList() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(notifications[index]),
        );
      },
    );
  }
}
