import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

void showShareBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Share",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                shareOption(AppAssets.copylinkIcons),
                shareOption(AppAssets.instaIcons),
                shareOption(AppAssets.fbIcons),
                shareOption(AppAssets.whatsappIcon),
                shareOption(AppAssets.mailIcon),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      );
    },
  );
}

Widget shareOption(String imagePath) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[300],
        child: Image.asset(imagePath, width: 40, height: 40),
      ),
    ],
  );
}
