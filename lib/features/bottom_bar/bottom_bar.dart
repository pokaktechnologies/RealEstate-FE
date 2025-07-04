import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/Deals/presentation/pages/Deals.dart';
import 'package:realestate_fe/features/home/pages/homePage.dart';
import 'package:realestate_fe/features/message/presentation/pages/message.dart';
import 'package:realestate_fe/features/profile/pages/profile/user_profile.dart';
import 'package:realestate_fe/features/saved/presentation/pages/empty_saved.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const DealsScreen(),
    const MessageScreen(),
    // const SavedScreen(),
    EmptySavedScreen(),
    const UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: BottomNavigationBar(
                  unselectedItemColor: Colors.grey,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          (_selectedIndex == 0)
                              ? AppColors.tealBlue
                              : AppColors.grey,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          AppAssets.homeIcon,
                          height: 30,
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          (_selectedIndex == 1)
                              ? AppColors.tealBlue
                              : AppColors.grey,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          AppAssets.dealsIcon,
                          height: 30,
                        ),
                      ),
                      label: 'Deals',
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          (_selectedIndex == 2)
                              ? AppColors.tealBlue
                              : AppColors.grey,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          AppAssets.messageIcon,
                          height: 30,
                        ),
                      ),
                      label: 'Messages',
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          (_selectedIndex == 3)
                              ? AppColors.tealBlue
                              : AppColors.grey,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          AppAssets.savedIcon,
                          height: 30,
                        ),
                      ),
                      label: 'Saved',
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          (_selectedIndex == 4)
                              ? AppColors.tealBlue
                              : AppColors.grey,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          AppAssets.profileIcon,
                          height: 30,
                        ),
                      ),
                      label: 'Profile',
                    ),
                  ],
                  selectedLabelStyle: const TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex,
                  selectedItemColor: AppColors.tealBlue,
                  iconSize: 30,
                  backgroundColor: AppColors.white,
                  onTap: (int index) {
                    if (index == 3) {
                      // Load ProfileController when profile tab is selected
                    }
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
