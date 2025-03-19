import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class BottomImage extends StatelessWidget {
  final bool isForyou;
  const BottomImage({super.key, required this.isForyou});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: isForyou ? AppColors.white : AppColors.lightMint,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Image.asset(AppAssets.pgBottomImg),
          ),
        )
      ],
    );
  }
}
