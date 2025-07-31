import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_bloc.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_event.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_state.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';

class StayFinderScreen extends StatefulWidget {
  const StayFinderScreen({super.key});

  @override
  State<StayFinderScreen> createState() => _StayFinderScreenState();
}

class _StayFinderScreenState extends State<StayFinderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PropertiesBloc>().add(const LoadIdealPGProperties());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertiesBloc, PropertiesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppLoadingIndicator();
        }
        if (state.idealPGList.isEmpty) {
          return const Center(child: Text("No Paying Guest Properties found"));
        }

        final properties = state.idealPGList;
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
                      "Find Your Ideal Pay Guest Stay",
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

              SizedBox(
                width: double.infinity,
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                  itemCount: properties.length, // ✅ use real length!
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PropertyDetailsScreen()),
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
                                Center(
                                  child: SizedBox(
                                    height: 120,
                                    width: double.infinity,
                                    child: Image.network(
                                      properties[i].images.isNotEmpty
                                          ? properties[i].images[0].imageName
                                          : 'https://via.placeholder.com/150',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          "₹${properties[i].price}",
                                          maxLines: 2,
                                          style: const TextStyle(
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
                                              properties[i].name.length > 10
                                                  ? '${properties[i].name.substring(0, 10)}...'
                                                  : properties[i].name,
                                              style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  initialRating: properties[i]
                                                      .overallRatings,
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
                                                  properties[i]
                                                      .overallRatings
                                                      .toString(),
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
                                          "${properties[i].city}, ${properties[i].state}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
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
            ],
          ),
        );
      },
    );
  }
}
