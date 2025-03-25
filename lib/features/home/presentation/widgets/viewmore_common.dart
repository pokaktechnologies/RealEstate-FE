import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';

class ViewmoreCommon extends StatelessWidget {
  final int index;
  const ViewmoreCommon({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Container(
      // height: height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppAssets.viewMoreSample,
              height: height * 0.2,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "3BHK House",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vytila, Kochi",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.grey,
                  ),
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
                      itemSize: 18,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: AppColors.ratingColor,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "(73)",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "₹1000/",
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Month",
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PropertyDetailsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.055,
                    width: width * 0.42,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.tealBlue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "View Details",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
