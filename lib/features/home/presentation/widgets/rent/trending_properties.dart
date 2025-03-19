import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class TrendingProperties extends StatelessWidget {
  const TrendingProperties({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> roomImg = [
      AppAssets.sampleImg3,
      AppAssets.sampleImg4,
      AppAssets.sampleImg3,
      AppAssets.sampleImg4,
      AppAssets.sampleImg3,
    ];
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
                  "Top Picks For You",
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

          MediaQuery.removePadding(
            context: context,
            removeBottom: false,
            removeLeft: false,
            removeRight: false,
            removeTop: false,
            child: SizedBox(
              width: double.infinity,
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(
                  12,
                  10,
                  12,
                  0,
                ),
                itemCount: 5,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {},
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
                                  child: Image.asset(
                                    roomImg[i],
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),
                                      Text(
                                        "₹50 Lakh",
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "3BHK House ",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                                  color: AppColors.ratingColor,
                                                ),
                                                onRatingUpdate: (rating) {},
                                              ),
                                              Text(
                                                "4.5",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      //-----
                                      Text(
                                        "Kakkanad, Kochi",
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

          // ============= end ============ .
        ],
      ),
    );
  }
}
