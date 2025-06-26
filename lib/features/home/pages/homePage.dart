import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/home/pages/buy_page.dart';
import 'package:realestate_fe/features/home/pages/foryou_page.dart';
import 'package:realestate_fe/features/home/pages/paying_guest.dart';
import 'package:realestate_fe/features/home/pages/rent_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const ForyouPage();
      case 1:
        return const RentPage();
      case 2:
        return const BuyPage();
      case 3:
        return const PayingGuest();
      default:
        return const ForyouPage();
    }
  }

  void openGoogleMaps(String searchQuery) async {
    final query = Uri.encodeComponent(searchQuery);
    final googleMapsUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
      _searchController.clear(); // Clear text after navigation
    } else {
      print("Could not open Google Maps");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.lightMint,
      appBar: AppBar(
        backgroundColor: AppColors.lightCyan,
        toolbarHeight: screenHeight * 0.09,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
              width: screenWidth * 0.25,
              child: Row(
                children: const [
                  Icon(Icons.location_on_sharp),
                  Text(
                    "Kochi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Icon(Icons.keyboard_arrow_down_sharp)
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 35,
                  width: 200,
                  child: TextField(
                    enabled: false,
                    controller: _searchController,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        openGoogleMaps(value);
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIconColor: AppColors.mediumGray,
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(vertical: 7),
                      hintText: "search",
                      hintStyle: TextStyle(
                        color: AppColors.mediumGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                const Icon(Icons.notifications_sharp, size: 26),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navItem(0, AppAssets.foryouIcon, "For You"),
                navItem(1, AppAssets.rentIcon, "Rent"),
                navItem(2, AppAssets.buyIcon, "Buy"),
                navItem(3, AppAssets.payingGuest, "Paying Guest"),
              ],
            ),
          ),
          Expanded(child: _getScreen(_selectedIndex)),
        ],
      ),
    );
  }

  Widget navItem(int index, String iconPath, String label) {
    bool isSelected = _selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              color: isSelected ? AppColors.tealBlue : AppColors.grey,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.tealBlue : AppColors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
