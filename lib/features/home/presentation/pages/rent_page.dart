import 'package:flutter/material.dart';
import 'package:realestate_fe/features/home/presentation/widgets/foryou/bottom_image.dart';
import 'package:realestate_fe/features/home/presentation/widgets/rent/rent_banner.dart';
import 'package:realestate_fe/features/home/presentation/widgets/rent/trending_properties.dart';

class RentPage extends StatelessWidget {
  const RentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          RentBanner(),
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
