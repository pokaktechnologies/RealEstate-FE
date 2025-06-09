import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/profile/pages/mybooking/mybooking_details.dart';
import 'package:realestate_fe/features/profile/pages/mybooking/share_bottomsheet.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final List<Map<String, dynamic>> bookings = [
    {
      "title": "The Hollies House",
      "location": "Kaloor, Kochi",
      "date": "Oct 2024 - Jan 2025",
      "status": "contact_host",
      "image": "assets/property/imageone.png"
    },
    {
      "title": "2BHK Apartment",
      "location": "Kaloor, Kochi",
      "date": "Oct 2024",
      "status": "cancelled",
      "image": "assets/property/imageone.png"
    },
    {
      "title": "2BHK Apartment",
      "location": "Kaloor, Kochi",
      "date": "May 2024 - Oct 2024",
      "status": "write_review",
      "image": "assets/property/imageone.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: Text(
          "Bookings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.arrowbackIcon),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            color: AppColors.white,
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          booking["image"],
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  booking["title"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    showShareBottomSheet(context);
                                  },
                                  child: Icon(
                                    Icons.share,
                                    color: AppColors.grey,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              booking["location"],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mediumGray),
                            ),
                            SizedBox(height: 4),
                            Text(
                              booking["date"],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mediumGray),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: AppColors.grey),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          _getButtonText(booking["status"]),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 48,
                      color: AppColors.grey,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingDetailsScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.black,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          "View Details",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getButtonText(String status) {
    switch (status) {
      case "cancelled":
        return "Cancelled";
      case "write_review":
        return "Write Review";
      default:
        return "Contact Host";
    }
  }
}
