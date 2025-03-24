import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class PropertyDetailsWidgets {
  static Widget buildPriceAndRating() {
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

  static Widget buildPropertyDetails() {
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

  static Widget buildFacilityContainer() {
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
              buildDetail(AppAssets.bedroomIcon, "Bedroom", "2"),
              buildDetail(AppAssets.bathroomIcon, "Bathroom", "2"),
            ],
          ),
          const SizedBox(height: 12), // Spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDetail(AppAssets.sqfeetIcon, "Build Up Area", "1250 sq-ft"),
              buildDetail(AppAssets.furnishedIcon, "Furnished", ""),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildDetail(String imagePath, String label, String value) {
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

  static Widget buildNearestPublicFacilities() {
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
              buildNearestDetails(
                  AppAssets.minimarketIcon, "Minimarket", "200m"),
              buildNearestDetails(AppAssets.hospitaIcon, "Hospital", "130m"),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNearestDetails(AppAssets.foodIcon, "Cafe", "400m"),
              buildNearestDetails(AppAssets.trainIcon, "Train station", "500m"),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildNearestDetails(
      String imagePath, String label, String value) {
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

  static Widget buildAboutProperty() {
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

  static Widget buildPropertySpecs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildPropertyRow("Property ID", "R11234", "Ownership", "Single",
            "Deposit", "₹50,000"),
        buildPropertyRow(
            "Total Floors", "02", "Constructed In", "2019", "State", "Kerala"),
        buildPropertyRow("District", "Eranakulam", "Town", "Kakkanad", "Street",
            "Gandhi Nagar"),
      ],
    );
  }

  static Widget buildPropertyRow(String title1, String value1, String title2,
      String value2, String title3, String value3) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildPropertyColumn(title1, value1),
          SizedBox(width: 15),
          buildPropertyColumn(title2, value2),
          SizedBox(width: 15),
          buildPropertyColumn(title3, value3),
        ],
      ),
    );
  }

  static Widget buildPropertyColumn(String title, String value) {
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
