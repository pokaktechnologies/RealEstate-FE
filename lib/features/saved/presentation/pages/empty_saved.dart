import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class EmptySavedScreen extends StatefulWidget {
  const EmptySavedScreen({super.key});

  @override
  State<EmptySavedScreen> createState() => _EmptySavedScreenState();
}

class _EmptySavedScreenState extends State<EmptySavedScreen> {
  final List<String> saved = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: const Text(
          "Saved",
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
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(AppAssets.arrowbackIcon),
          ),
        ),
        backgroundColor: AppColors.white,
      ),
      body: saved.isEmpty ? _buildEmptySavedState() : _buildNotificationList(),
    );
  }

  // Empty notification UI
  Widget _buildEmptySavedState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.nosaved,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            "Nothing saved yet",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.mediumGray),
          ),
          const SizedBox(height: 5),
          const Text(
            "Start saving your favorites! ",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.mediumGray),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Explore",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Notification list UI
  Widget _buildNotificationList() {
    return ListView.builder(
      itemCount: saved.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(saved[index]),
        );
      },
    );
  }
}
