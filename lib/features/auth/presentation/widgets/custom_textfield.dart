import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final String prefixImg;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.prefixImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGray, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: TextFormField(
        style: TextStyle(
          color: AppColors.black, // Text color
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 16, vertical: 13), // Inner padding
          border: InputBorder.none, // Removes default border
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.black.withOpacity(0.6), // Faded text for hint
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),

          // 🔹 Add an Image on the Left (Prefix)
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12), // Adjust spacing
            child: Image.asset(
              prefixImg,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
