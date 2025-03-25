import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/message/presentation/pages/chat_screen.dart';
import 'package:realestate_fe/features/payment/presentation/pages/payment_screen.dart';
import 'package:realestate_fe/features/profile/presentation/pages/mybooking/share_bottomsheet.dart';
import 'package:realestate_fe/features/property_details/presentation/blocs/wishlist.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/reviews.dart';
import 'package:realestate_fe/features/property_details/presentation/widgets/property_details/details.dart';

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
      create: (context) => FavoriteBloc(),
      child: Scaffold(
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen()),
                        );
                      },
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
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(AppAssets.arrowbackIcon),
          ),
          backgroundColor: AppColors.white,
          actions: [
            InkWell(
              onTap: () {
                showShareBottomSheet(context);
              },
              child: Icon(
                Icons.share,
                color: AppColors.tealBlue,
              ),
            ),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                      state is FavoriteFilledState
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColors.tealBlue),
                  onPressed: () {
                    context.read<FavoriteBloc>().add(ToggleFavoriteEvent());
                  },
                );
              },
            ),
          ],
        ),
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
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
            Positioned(
              right: 16,
              top: MediaQuery.of(context).size.height * 0.18,
              child: GestureDetector(
                onTap: _nextImage,
                child: const Icon(Icons.chevron_right,
                    color: AppColors.white, size: 50),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return Container(
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
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PropertyDetailsWidgets.buildPriceAndRating(),
                        const SizedBox(height: 10),
                        PropertyDetailsWidgets.buildPropertyDetails(),
                        const SizedBox(height: 10),
                        PropertyDetailsWidgets.buildFacilityContainer(),
                        const SizedBox(height: 10),
                        PropertyDetailsWidgets.buildAboutProperty(),
                        const SizedBox(height: 10),
                        PropertyDetailsWidgets.buildPropertySpecs(),
                        const SizedBox(height: 10),
                        PropertyDetailsWidgets.buildNearestPublicFacilities(),
                        const SizedBox(height: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                        name: "Annie Steve",
                                        imageUrl: AppAssets.annieprofile,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
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
                                  child: Icon(Icons.chat_bubble,
                                      color: Colors.teal),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        ReviewsScreen(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
