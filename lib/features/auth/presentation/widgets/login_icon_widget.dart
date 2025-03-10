import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class LoginIconWidget extends StatelessWidget {
  final String assetImg;
  const LoginIconWidget({
    super.key,
    required this.assetImg,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("button pressed");
      },
      child: Container(
        height: 40,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.tealBlue,
            width: 0.5,
          ),
        ),
        child: Center(child: Image.asset(assetImg)),
      ),
    );
  }
}
