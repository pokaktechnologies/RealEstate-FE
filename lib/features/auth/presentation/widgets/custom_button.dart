import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  const CustomButton({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("button pressed");
      },
      child: Container(
        height: 43,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.tealBlue,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
