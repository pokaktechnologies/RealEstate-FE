// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:realestate_fe/core/utils/app_assets.dart';
// import 'package:realestate_fe/core/utils/app_colors.dart';
// import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';

// class ViewmoreCommon extends StatelessWidget {
//   final int index;
//   const ViewmoreCommon({super.key, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;

//     return Container(
//       // height: height * 0.4,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.grey),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               AppAssets.viewMoreSample,
//               height: height * 0.2,
//               width: double.infinity,
//               fit: BoxFit.fill,
//             ),
//             SizedBox(
//               height: height * 0.01,
//             ),
//             Text(
//               "3BHK House",
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(
//               height: height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Vytila, Kochi",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15,
//                     color: AppColors.grey,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     RatingBar.builder(
//                       initialRating: 1,
//                       minRating: 1,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 1,
//                       ignoreGestures: true,
//                       itemSize: 18,
//                       itemBuilder: (context, _) => const Icon(
//                         Icons.star,
//                         color: AppColors.ratingColor,
//                       ),
//                       onRatingUpdate: (rating) {},
//                     ),
//                     Text(
//                       "4.5",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                     Text(
//                       "(73)",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: height * 0.015,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     text: "₹1000/",
//                     style: const TextStyle(
//                       color: AppColors.black,
//                       fontSize: 21,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "Month",
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: AppColors.black,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     height: height * 0.055,
//                     width: width * 0.42,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColors.tealBlue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "View Details",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: height * 0.02,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';
import 'package:realestate_fe/models/rent_properties_model.dart';

class ViewmoreCommon extends StatelessWidget {
  final RentPropertiesModel property;
  const ViewmoreCommon({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Container(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                property.images.isNotEmpty
                    ? property.images[0].imageName
                    : "https://via.placeholder.com/150",
                height: height * 0.2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              property.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${property.city}, ${property.state}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.grey,
                  ),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: property.overallRatings,
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
                      onRatingUpdate: (_) {},
                    ),
                    Text(
                      property.overallRatings.toStringAsFixed(1),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "₹${property.price}/",
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const [
                      TextSpan(
                        text: "Month",
                        style: TextStyle(
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
                        builder: (context) => PropertyDetailsScreen(
                          propertyId: property.id,
                        ),
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
                    child: const Center(
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
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
