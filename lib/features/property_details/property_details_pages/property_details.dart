import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/message/message_pages/chat_screen.dart';
import 'package:realestate_fe/features/payment/payment_pages/payment_screen.dart';
import 'package:realestate_fe/features/profile/profile_pages/mybooking/share_bottomsheet.dart';
import 'package:realestate_fe/features/property_details/property_detail_bloc/propertydetails_bloc.dart';
import 'package:realestate_fe/features/property_details/saved_bloc/wishlist.dart';
import 'package:realestate_fe/features/property_details/property_details_pages/reviews.dart';
import 'package:realestate_fe/features/property_details/widgets/property_details/details.dart';
import 'package:realestate_fe/models/propertydetails_model.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final int propertyId;
  const PropertyDetailsScreen({super.key, required this.propertyId});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  int _currentIndex = 0;

  List<String> images = [];

  @override
  void initState() {
    super.initState();
    context
        .read<PropertydetailsBloc>()
        .add(LoadPropertyDetails(widget.propertyId));
  }

  void _showContactMenu(BuildContext buttonContext) {
    final RenderBox button = buttonContext.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(buttonContext).context.findRenderObject() as RenderBox;
    final Offset buttonPosition =
        button.localToGlobal(Offset.zero, ancestor: overlay);

    showDialog(
      context: buttonContext,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              left: buttonPosition.dx,
              top: buttonPosition.dy - 180,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: button.size.width + 25,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Image.asset(AppAssets.sendmessageIcon),
                        title: const Text(
                          "Send Message",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              fontSize: 14),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                name: "Annie",
                                imageUrl: AppAssets.annieprofile,
                              ),
                            ),
                          );
                        },
                      ),
                      Divider(color: Colors.grey[300]),
                      ListTile(
                        leading: Image.asset(AppAssets.callingIcon),
                        title: const Text(
                          "Call",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              fontSize: 14),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
                  child: Builder(builder: (contactButtonContext) {
                    return SizedBox(
                      height: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showContactMenu(contactButtonContext);
                        },
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
                    );
                  }),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen()),
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
        body: BlocBuilder<PropertydetailsBloc, PropertydetailsState>(
          builder: (context, state) {
            if (state is PropertydetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PropertydetailsError) {
              return Center(child: Text(state.error));
            } else if (state is PropertydetailsLoaded) {
              PropertyDetailsModel property = state.property;

              images = property.images?.map((e) => e.image).toList() ?? [];
              if (images.isEmpty) {
                images = [AppAssets.imageOne];
              }

              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) =>
                            FadeTransition(opacity: animation, child: child),
                        child: Image.network(
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PropertyDetailsWidgets.buildPriceAndRating(
                                  property),
                              const SizedBox(height: 10),
                              PropertyDetailsWidgets.buildPropertyDetails(
                                  property),
                              const SizedBox(height: 10),
                              PropertyDetailsWidgets.buildFacilityContainer(
                                  property),
                              const SizedBox(height: 10),
                              PropertyDetailsWidgets.buildAboutProperty(
                                  property),
                              const SizedBox(height: 10),
                              PropertyDetailsWidgets.buildPropertySpecs(
                                  property),
                              const SizedBox(height: 10),
                              PropertyDetailsWidgets
                                  .buildNearestPublicFacilities(property),
                              const SizedBox(height: 10),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: AssetImage(
                                              AppAssets.annieprofile),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
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
                              ReviewsScreen(
                                propertyId: property.id,
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
