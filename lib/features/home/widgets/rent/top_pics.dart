import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/core/utils/navigations.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_bloc.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_event.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_state.dart';
import 'package:realestate_fe/features/home/widgets/viewallscreen/viewall.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';

class TopPicksForYou extends StatefulWidget {
  const TopPicksForYou({super.key});

  @override
  State<TopPicksForYou> createState() => _TopPicksForYouState();
}

class _TopPicksForYouState extends State<TopPicksForYou> {
  @override
  void initState() {
    super.initState();
    context.read<PropertiesBloc>().add(LoadrentProperties());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertiesBloc, PropertiesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppLoadingIndicator();
        }
        if (state.rentpropertiesList.isEmpty) {
          return const Text("No category rent properties found");
        }
        final rentproperties = state.rentpropertiesList;

        return Container(
          height: 290,
          color: AppColors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  top: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Pics For You",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pushNavigation(
                          context,
                          ViewAllGridScreen(
                            title: 'Top Pics For You',
                            properties: state.rentpropertiesList,
                          ),
                        );
                      },
                      child: Container(
                        height: 38,
                        width: 65,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.tealBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // ------------------------------start =============

              MediaQuery.removePadding(
                context: context,
                removeBottom: false,
                removeLeft: false,
                removeRight: false,
                removeTop: false,
                child: SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(
                      12,
                      10,
                      12,
                      0,
                    ),
                    itemCount: rentproperties.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          pushNavigation(
                              context,
                              PropertyDetailsScreen(
                                propertyId: rentproperties[i].id,
                              ));
                        },
                        child: SizedBox(
                          width: 170,
                          height: 195,
                          child: Card(
                            color: AppColors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: AppColors.blackTranslucent,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 2,
                                right: 4,
                                left: 4,
                                bottom: 2,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Center(
                                    child: SizedBox(
                                      height: 120,
                                      width: double.infinity,
                                      child: rentproperties[i].images.isNotEmpty
                                          ? Image.network(
                                              rentproperties[i]
                                                  .images[0]
                                                  .imageName,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/no-img.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 4),
                                          Text(
                                            "₹${rentproperties[i].price.toString()}",
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                rentproperties[i].name.length >
                                                        10
                                                    ? '${rentproperties[i].name.substring(0, 10)}...'
                                                    : rentproperties[i].name,
                                                style: TextStyle(
                                                  color: AppColors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Row(
                                                children: [
                                                  RatingBar.builder(
                                                    initialRating: 1,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 1,
                                                    ignoreGestures: true,
                                                    itemSize: 14,
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color:
                                                          AppColors.ratingColor,
                                                    ),
                                                    onRatingUpdate: (rating) {},
                                                  ),
                                                  Text(
                                                    rentproperties[i]
                                                        .overallRatings
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          //-----
                                          Text(
                                            "${rentproperties[i].city}, ${rentproperties[i].state}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: AppColors.lightBlack,
                                              fontSize: 12,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
