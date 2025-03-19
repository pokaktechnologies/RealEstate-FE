import 'package:flutter/material.dart';
import 'package:realestate_fe/features/home/presentation/widgets/buy/buy_banner.dart';
import 'package:realestate_fe/features/home/presentation/widgets/buy/trending_properties.dart';
import 'package:realestate_fe/features/home/presentation/widgets/foryou/bottom_image.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          BuyBanner(),
          SizedBox(height: 10),
          TrendingProperties(),
          BottomImage(
            isForyou: false,
          ),
        ],
      ),
    );
  }
}
