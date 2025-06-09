import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/profile/pages/profile_tile/notification.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.arrowbackIcon),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsTile("Account", AppAssets.accountIcon, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                }),
                SettingsTile("Privacy", AppAssets.privacyIcon, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                }),
                SettingsTile("Help and Support", AppAssets.helpsupportIcon, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                }),
                SettingsTile("Terms and policies", AppAssets.termsIcon, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                }),
                SettingsTile("Payments", AppAssets.logoutIcon, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                }),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsTile extends StatefulWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const SettingsTile(this.title, this.imagePath, this.onTap, {super.key});

  @override
  _SettingsTileState createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.white, width: 1.5),
        ),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              leading: Image.asset(
                widget.imagePath,
                height: 24,
                width: 24,
              ),
              title: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              trailing: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: AppColors.tealBlue,
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Expanded content for ${widget.title}",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
