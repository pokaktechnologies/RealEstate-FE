import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/home/presentation/blocs/homepage_cubit.dart';
import 'package:realestate_fe/features/profile/presentation/pages/profile_tile/notification.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    void _openGoogleMaps(String searchQuery) async {
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
                children: [
                  Icon(Icons.location_on_sharp),
                  Text(
                    "Kochi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
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
                    enabled: false, // you want to type , please remove that
                    controller: _searchController,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _openGoogleMaps(value);
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIconColor: AppColors.mediumGray,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(vertical: 7),
                      hintText: "search",
                      hintStyle: TextStyle(
                        color: AppColors.mediumGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => NotificationsScreen()),
                    // );
                  },
                  child: Icon(
                    Icons.notifications_sharp,
                    size: 26,
                  ),
                ),
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
            child: BlocBuilder<HomepageCubit, int>(
              builder: (context, selectedIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    navItem(
                      context,
                      selectedIndex,
                      0,
                      AppAssets.foryouIcon,
                      "For You",
                    ),
                    navItem(
                      context,
                      selectedIndex,
                      1,
                      AppAssets.rentIcon,
                      "Rent",
                    ),
                    navItem(
                      context,
                      selectedIndex,
                      2,
                      AppAssets.buyIcon,
                      "Buy",
                    ),
                    navItem(
                      context,
                      selectedIndex,
                      3,
                      AppAssets.payingGuest,
                      "Paying Guest",
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<HomepageCubit, int>(
              builder: (context, state) {
                return context.read<HomepageCubit>().getScreen(state);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem(
    BuildContext context,
    int selectedIndex,
    int index,
    String iconPath,
    String label,
  ) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        context.read<HomepageCubit>().changeTab(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              color: isSelected ? AppColors.tealBlue : AppColors.grey,
            ),
            SizedBox(width: 5),
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
