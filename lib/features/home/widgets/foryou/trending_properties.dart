import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_bloc.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_event.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_state.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';

class TrendingProperties extends StatefulWidget {
  const TrendingProperties({super.key});

  @override
  State<TrendingProperties> createState() => _TrendingPropertiesState();
}

class _TrendingPropertiesState extends State<TrendingProperties> {
  @override
  void initState() {
    super.initState();
    context.read<PropertiesBloc>().add(
          LoadTrendingPropertiesNearYou(
            latitude: 11.32,
            longitude: 75.92,
            radius: 19,
            category: 'all',
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertiesBloc, PropertiesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppLoadingIndicator();
        }
        if (state.trendingProperties.isEmpty) {
          return const Text("No Trending Properties found near you.");
        }
        final properties = state.trendingProperties;

        return Container(
          height: 290,
          color: AppColors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trending Properties Near You",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 38,
                        width: 65,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
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

              // Trending properties list
              SizedBox(
                width: double.infinity,
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                  itemCount: properties.length,
                  itemBuilder: (context, i) {
                    final property = properties[i];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PropertyDetailsScreen(propertyId: property.id,),
                          ),
                        );
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
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 5),
                                SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child: Image.network(
                                    property.images.isNotEmpty
                                        ? property.images[0].imageName
                                        : '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          "₹${property.price}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              property.name.length > 10
                                                  ? '${property.name.substring(0, 10)}...'
                                                  : property.name,
                                              style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  initialRating:
                                                      property.overallRatings,
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
                                                  onRatingUpdate: (_) {},
                                                ),
                                                Text(
                                                  property.overallRatings
                                                      .toStringAsFixed(1),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${property.city}, ${property.state}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: AppColors.lightBlack,
                                            fontSize: 12,
                                          ),
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
            ],
          ),
        );
      },
    );
  }
}
