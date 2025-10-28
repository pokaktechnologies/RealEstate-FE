// import 'package:flutter/material.dart';
// import 'package:realestate_fe/core/utils/app_assets.dart';
// import 'package:realestate_fe/core/utils/app_colors.dart';
// import 'package:realestate_fe/features/home/home_pages/buy_page.dart';
// import 'package:realestate_fe/features/home/home_pages/foryou_page.dart';
// import 'package:realestate_fe/features/home/home_pages/paying_guest.dart';
// import 'package:realestate_fe/features/home/home_pages/rent_page.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   final TextEditingController _searchController = TextEditingController();
//   int _selectedIndex = 0;

//   Widget _getScreen(int index) {
//     switch (index) {
//       case 0:
//         return const ForyouPage();
//       case 1:
//         return const RentPage(category: "rent");

//       case 2:
//         return const BuyPage(
//           category: "buy",
//         );
//       case 3:
//         return const PayingGuest();
//       default:
//         return const ForyouPage();
//     }
//   }

//   void openGoogleMaps(String searchQuery) async {
//     final query = Uri.encodeComponent(searchQuery);
//     final googleMapsUrl =
//         Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

//     if (await canLaunchUrl(googleMapsUrl)) {
//       await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
//       _searchController.clear();
//     } else {
//       print("Could not open Google Maps");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: AppColors.lightMint,
//       appBar: AppBar(
//         backgroundColor: AppColors.lightCyan,
//         toolbarHeight: screenHeight * 0.09,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: screenHeight * 0.05,
//               width: screenWidth * 0.25,
//               child: Row(
//                 children: const [
//                   Icon(Icons.location_on_sharp),
//                   Text(
//                     "Kochi",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//                   ),
//                   Icon(Icons.keyboard_arrow_down_sharp)
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   height: 35,
//                   width: 200,
//                   child: TextField(
//                     enabled: false,
//                     controller: _searchController,
//                     onSubmitted: (value) {
//                       if (value.isNotEmpty) {
//                         openGoogleMaps(value);
//                       }
//                     },
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: AppColors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       prefixIconColor: AppColors.mediumGray,
//                       prefixIcon: const Icon(Icons.search),
//                       contentPadding: const EdgeInsets.symmetric(vertical: 7),
//                       hintText: "search",
//                       hintStyle: TextStyle(
//                         color: AppColors.mediumGray,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 3),
//                 const Icon(Icons.notifications_sharp, size: 26),
//               ],
//             )
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 60,
//             color: AppColors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 navItem(0, AppAssets.foryouIcon, "For You"),
//                 navItem(1, AppAssets.rentIcon, "Rent"),
//                 navItem(2, AppAssets.buyIcon, "Buy"),
//                 navItem(3, AppAssets.payingGuest, "Paying Guest"),
//               ],
//             ),
//           ),
//           Expanded(child: _getScreen(_selectedIndex)),
//         ],
//       ),
//     );
//   }

//   Widget navItem(int index, String iconPath, String label) {
//     bool isSelected = _selectedIndex == index;

//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Image.asset(
//               iconPath,
//               color: isSelected ? AppColors.tealBlue : AppColors.grey,
//             ),
//             const SizedBox(width: 5),
//             Text(
//               label,
//               style: TextStyle(
//                 color: isSelected ? AppColors.tealBlue : AppColors.grey,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/home/home_pages/buy_page.dart';
import 'package:realestate_fe/features/home/home_pages/foryou_page.dart';
import 'package:realestate_fe/features/home/home_pages/paying_guest.dart';
import 'package:realestate_fe/features/home/home_pages/rent_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  String _currentLocation = "Fetching...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 📍 Get user current location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _currentLocation = "Location off";
      });
      return;
    }

    // Check for permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _currentLocation = "Permission denied";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = "Permission permanently denied";
      });
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Convert coordinates to address
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks.first;

    setState(() {
      _currentLocation = place.locality ?? "Unknown";
    });
  }

  // 🌍 Open Google Maps with a search query
  void openGoogleMaps(String searchQuery) async {
    final query = Uri.encodeComponent(searchQuery);
    final googleMapsUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
      _searchController.clear();
    } else {
      print("Could not open Google Maps");
    }
  }

  // 🧭 Navigation screens
  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const ForyouPage();
      case 1:
        return const RentPage(category: "rent");
      case 2:
        return const BuyPage(category: "buy");
      case 3:
        return const PayingGuest();
      default:
        return const ForyouPage();
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
            // 📍 Location display (tap to refresh)
            GestureDetector(
              onTap: _getCurrentLocation,
              child: SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth * 0.25,
                child: Row(
                  children: [
                    const Icon(Icons.location_on_sharp),
                    Expanded(
                      child: Text(
                        _currentLocation,
                        // overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_sharp),
                  ],
                ),
              ),
            ),

            //  Search and notification
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
            ),
          ],
        ),
      ),

      // Body content with tabs
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

  // Bottom navigation items
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
