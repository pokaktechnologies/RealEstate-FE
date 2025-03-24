import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/profile/presentation/pages/mybooking/mybooking_Main.dart';
import 'package:realestate_fe/features/profile/presentation/pages/profile/edit_profile.dart';
import 'package:realestate_fe/features/profile/presentation/pages/profile_tile/language.dart';
import 'package:realestate_fe/features/profile/presentation/pages/profile_tile/logout.dart';
import 'package:realestate_fe/features/profile/presentation/pages/profile_tile/notification.dart';
import 'package:realestate_fe/features/profile/presentation/pages/profile_tile/settings.dart';
import 'package:realestate_fe/features/profile/presentation/pages/transaction/transaction.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(AppAssets.userProfile),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Albert John",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "+91 856321478",
                              style: TextStyle(
                                  color: AppColors.mediumGray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "albertjohn@abc.com",
                                  style: TextStyle(
                                      color: AppColors.mediumGray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    AppAssets.editIcon,
                                    height: 20,
                                    width: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingsScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.tealBlue,
                          backgroundColor: AppColors.white,
                          side: BorderSide(
                            color: AppColors.tealBlue,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "My Bookings",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionsScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.tealBlue,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: AppColors.tealBlue),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Transactions",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _WidgetListTile("Notifications", AppAssets.notificationIcon,
                    () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                }),
                _WidgetListTile("Dark Mode", AppAssets.darkmodeIcon, () {},
                    trailing: CustomSwitch(
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                    )),
                _WidgetListTile("Settings", AppAssets.settingsIcon, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                }),
                _WidgetListTile("Language", AppAssets.languageIcon, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LanguageSelectionScreen(),
                    ),
                  );
                }),
                _WidgetListTile("Logout", AppAssets.logoutIcon, () {
                  showLogoutDialog(context);
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

Widget _WidgetListTile(String title, String imagePath, VoidCallback onTap,
    {Widget? trailing}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white, width: 1.5),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: Image.asset(
          imagePath,
          height: 24,
          width: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    ),
  );
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 45,
        height: 18,
        decoration: BoxDecoration(
          color: widget.value ? AppColors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 20,
            height: 25,
            decoration: BoxDecoration(
              color: AppColors.mediumGray,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
