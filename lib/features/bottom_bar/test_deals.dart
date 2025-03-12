import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class TestDeals extends StatelessWidget {
  const TestDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightMint,
      body: Center(
        child: Container(
          height: 50,
          width: 100,
          color: Colors.red,
          child: Text(
            "Deals page",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
