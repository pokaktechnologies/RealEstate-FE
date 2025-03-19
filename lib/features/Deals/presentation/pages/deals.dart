import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: Text(
          'Deals',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.black),
        ),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                AppAssets.dealsoffer,
                width: double.infinity, // Full screen width
                fit:
                    BoxFit.cover, // Ensures the image covers the width properly
              ),
              SizedBox(height: 16),
              Image.asset(
                AppAssets.dealscreditcard,
                width: double.infinity, // Full screen width
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
