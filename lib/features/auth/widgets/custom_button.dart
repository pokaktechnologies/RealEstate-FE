import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget buttonText;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 43,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.tealBlue,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Center(
          child: buttonText,

          // Text(
          //   buttonText,
          //   style: TextStyle(
          //     color: AppColors.white,
          //     fontSize: 17,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ),
      ),
    );
  }
}
