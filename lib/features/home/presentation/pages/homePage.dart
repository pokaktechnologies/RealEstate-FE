import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightCyan,
        toolbarHeight: screenHeight * 0.09,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
              width: screenWidth * 0.3,
              child: Row(
                children: [
                  Icon(Icons.location_on_sharp),
                  Text(
                    "Kochi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_sharp)
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 35,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIconColor: AppColors.mediumGray,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(vertical: 7),
                      hintText: "search",
                      hintStyle: TextStyle(
                        color: AppColors.mediumGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.notifications_sharp,
                  size: 26,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
