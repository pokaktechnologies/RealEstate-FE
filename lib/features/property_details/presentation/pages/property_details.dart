import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/property_details/presentation/blocs/wishlist.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/reviews.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({super.key});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  int _currentIndex = 0;

  final List<String> images = [
    AppAssets.imageOne,
    AppAssets.imageTwo,
    AppAssets.imagethree
  ];

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(), // Provide the FavoriteBloc
      child: Scaffold(
        // contact and Book now button
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomAppBar(
            color: AppColors.white,
            elevation: 4,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.tealBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.teal,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //--------
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(AppAssets.arrowbackIcon),
          ),
          backgroundColor: AppColors.white,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.share,
                  color: AppColors.tealBlue,
                ),
                onPressed: () {}),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                      state is FavoriteFilledState
                          ? Icons.favorite
                          : Icons.favorite_border, // Toggle icon
                      color: AppColors.tealBlue // Keep color consistent
                      ),
                  onPressed: () {
                    context
                        .read<FavoriteBloc>()
                        .add(ToggleFavoriteEvent()); // Trigger event
                  },
                );
              },
            ),
          ],
        ),
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            // Top Image with Carousel Effect
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Image.asset(
                    images[_currentIndex],
                    key: ValueKey<int>(_currentIndex),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            // Next Image Button
            Positioned(
              right: 16,
              top: MediaQuery.of(context).size.height * 0.18,
              child: GestureDetector(
                onTap: _nextImage,
                child: const Icon(Icons.chevron_right,
                    color: AppColors.white, size: 50),
              ),
            ),

            // Curved Bottom Container
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                padding: const EdgeInsets.all(24.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPriceAndRating(),
                      const SizedBox(height: 10),
                      _buildPropertyDetails(),
                      const SizedBox(height: 10),
                      _buildFacilityContainer(),
                      const SizedBox(height: 10),
                      _buildAboutProperty(),
                      const SizedBox(height: 10),
                      _buildPropertySpecs(),
                      const SizedBox(height: 20),
                      _nearestpublicfacilities(),
                      const SizedBox(height: 20),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage(AppAssets.annieprofile),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Annie Steve",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      "Host",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.mediumGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child:
                                  Icon(Icons.chat_bubble, color: Colors.teal),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      ReviewsScreen(),
                      const SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "₹50,00,000",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.tealBlue),
        ),
        Row(
          children: const [
            Icon(Icons.star, color: AppColors.ratingColor, size: 25),
            SizedBox(width: 4),
            Text(
              "4.5",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black),
            ),
            SizedBox(width: 4),
            Text("(73)",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.mediumGray)),
          ],
        ),
      ],
    );
  }

  Widget _buildPropertyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Furnished 2BHK apartment in a prime location",
          style: TextStyle(
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        Text(
          "Kakkanad- Kochi, Eranakulam, Kerala",
          style: TextStyle(
              fontSize: 14,
              color: AppColors.mediumGray,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildFacilityContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF8F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetail(AppAssets.bedroomIcon, "Bedroom", "2"),
              _buildDetail(AppAssets.bathroomIcon, "Bathroom", "2"),
            ],
          ),
          const SizedBox(height: 12), // Spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetail(AppAssets.sqfeetIcon, "Build Up Area", "1250 sq-ft"),
              _buildDetail(AppAssets.furnishedIcon, "Furnished", ""),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(String imagePath, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 28,
          height: 25,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: AppColors.mediumGray,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            if (value.isNotEmpty)
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _nearestpublicfacilities() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF8F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNerestdetails(
                  AppAssets.minimarketIcon, "Minimarket", "200m"),
              _buildNerestdetails(
                  AppAssets.hospitaIcon, "Hospital       ", "130m"),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNerestdetails(AppAssets.foodIcon, "Cafe", "400m"),
              _buildNerestdetails(AppAssets.trainIcon, "Train station", "500m"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNerestdetails(String imagePath, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 28,
          height: 25,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            if (value.isNotEmpty)
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mediumGray,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutProperty() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        Text(
          "About the property",
          style: TextStyle(
              fontSize: 18,
              color: AppColors.black,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 5),
        Text(
          "Furnished 2BHK apartment in a prime location, offering modern amenities like a gym, parking, "
          "and easy access to public transport. Perfect for families or individuals seeking a comfortable, "
          "long-term rental. Includes furniture like Refrigerator, Washing Machine, Air Conditioner, Tables and chairs.",
          style: TextStyle(
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _buildPropertySpecs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPropertyRow("Property ID", "R11234", "Ownership", "Single",
            "Deposit", "₹50,000"),
        _buildPropertyRow(
            "Total Floors", "02", "Constructed In", "2019", "State", "Kerala"),
        _buildPropertyRow("District", "Eranakulam", "Town", "Kakkanad",
            "Street", "Gandhi Nagar"),
      ],
    );
  }

  Widget _buildPropertyRow(String title1, String value1, String title2,
      String value2, String title3, String value3) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPropertyColumn(title1, value1),
          SizedBox(
            width: 15,
          ),
          _buildPropertyColumn(title2, value2),
          SizedBox(
            width: 15,
          ),
          _buildPropertyColumn(title3, value3),
        ],
      ),
    );
  }

  Widget _buildPropertyColumn(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, color: AppColors.mediumGray)),
          Text(value,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black)),
        ],
      ),
    );
  }
}
