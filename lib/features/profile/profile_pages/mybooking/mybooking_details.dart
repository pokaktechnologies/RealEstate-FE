import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/profile/profile_pages/mybooking/mybookinginfo.dart';
import 'package:realestate_fe/features/profile/profile_pages/mybooking/mybooking_cancel/mybooking_cancel.dart';

import 'package:realestate_fe/features/profile/profile_pages/mybooking/receipt_bottomsheet.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightGray,
        appBar: AppBar(
          title: Text(
            "Bookings Details",
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppAssets.imageOne,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "The Hollies House",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 99, 172, 231),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(
                                    "Boys",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "Kaloor, Kochi",
                              style: TextStyle(
                                color: AppColors.mediumGray,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              "₹8000/Month",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.tealBlue,
                              ),
                            ),
                            Text(
                              "Oct  2024 ",
                              style: TextStyle(
                                color: AppColors.mediumGray,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Column(
                children: [
                  Mybookinginfo(
                    title: "Booking Info",
                    details: {
                      "Property ID": "R11234",
                      "Check-in Date": "10 October 2024",
                      "Check-out Date": "10 October 2024",
                      "Payment Status": "Paid",
                      "Amount Paid": "₹ 19,000",
                    },
                    bottomButtons: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.black,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppAssets.contactIcons,
                                    width: 18, height: 18),
                                const SizedBox(width: 4),
                                const Text("Contact Host",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black)),
                              ],
                            ),
                          ),
                        ),
                        Container(width: 1, height: 48, color: AppColors.grey),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BookingCancelScreen()),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.black,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppAssets.cancelIcons,
                                    width: 18, height: 18),
                                const SizedBox(width: 4),
                                const Text("Cancel Booking",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Mybookinginfo(
                    title: "Payment Details",
                    details: {
                      "Rent amount": "₹ 8,000",
                      "Security deposit": "₹ 10,000",
                      "Service Fee": "₹ 1,000",
                      "Payment Method": " UPI",
                    },
                    bottomButtons: Center(
                      child: SizedBox(
                        width: 200,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (context) => DownloadReceiptSheet(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.tealBlue,
                            foregroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Download Receipt",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              buildExpandableTile("Property Features"),
              buildExpandableTile("Nearest Public Facilities"),
              buildExpandableTile("Host Details"),
            ],
          ),
        ));
  }

  Widget buildExpandableTile(String title) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.black),
        ),
        trailing: Image.asset(
          AppAssets.arrowdownIcon,
          width: 24,
          height: 24,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Details about $title go here..."),
          ),
        ],
      ),
    );
  }
}
