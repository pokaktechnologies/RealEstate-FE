import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/profile/pages/mybooking/mybookinginfo.dart';
import 'package:realestate_fe/features/profile/pages/mybooking/mybooking_cancel/cancel_dialogbox.dart';

class CancellationDetailsScreen extends StatelessWidget {
  const CancellationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightGray,
        appBar: AppBar(
          title: Text(
            "Cancellation Details",
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                      "Cancellation Date": "10 October 2024",
                      "Refundable Amount": "₹ 18,000",
                      "Amount Paid": "₹ 19,000",
                      "Refund Status": "Initiated",
                      "Expected Refund Date": "27 October 2024"
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
                            child: const Text("Contact Support",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black)),
                          ),
                        ),
                        Container(width: 1, height: 48, color: AppColors.grey),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.black,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text("View Refund Policy",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "** Note",
                      style: TextStyle(
                          color: AppColors.mediumGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Cancellation may result in a partial or no refund as per the cancellation policy.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: AppColors.mediumGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Please review the cancellation policy before proceeding",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: AppColors.mediumGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
