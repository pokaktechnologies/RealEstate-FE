import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          "Are you sure you want to log out?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        content: Text(
          "You will need to enter your credentials to log in again",
          style: TextStyle(
              fontSize: 16,
              color: AppColors.mediumGray,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: AppColors.mediumGray),
            ),
          ),
          TextButton(
            onPressed: () {
              // Perform logout action here
              Navigator.pop(context); // Close dialog
            },
            child: Text(
              "Logout",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: AppColors.tealBlue),
            ),
          ),
        ],
      );
    },
  );
}
