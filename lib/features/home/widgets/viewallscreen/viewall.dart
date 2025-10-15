import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';
import 'package:realestate_fe/models/rent_properties_model.dart';

class ViewAllGridScreen extends StatelessWidget {
  final String title;
  final List<RentPropertiesModel> properties;

  const ViewAllGridScreen({
    super.key,
    required this.title,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen size
    final crossAxisCount =
        size.width < 600 ? 2 : 3; // 2 for phones, 3 for tablets
    final imageHeight = size.height * 0.18; // dynamic image height

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssets.arrowbackIcon),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: properties.isEmpty
          ? Center(
              child: Text(
                "No $title found",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.black,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: properties.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // 🔹 Automatically adjusts height based on screen width
                  childAspectRatio:
                      (size.width / crossAxisCount) / (size.height * 0.32),
                ),
                itemBuilder: (context, index) {
                  final property = properties[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PropertyDetailsScreen(
                            propertyId: property.id,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: AppColors.blackTranslucent,
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔹 Responsive image section
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: property.images.isNotEmpty
                                ? Image.network(
                                    property.images[0].imageName,
                                    height: imageHeight,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/no-img.jpg',
                                    height: imageHeight,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.008,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹${property.price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.038,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      property.name.length > 10
                                          ? '${property.name.substring(0, 10)}...'
                                          : property.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: size.width * 0.034,
                                        fontWeight: FontWeight.bold,
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
                                          itemSize: 14,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: AppColors.ratingColor,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                        Text(
                                          property.overallRatings.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "${property.city}, ${property.state}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: size.width * 0.03,
                                    color: AppColors.lightBlack,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
