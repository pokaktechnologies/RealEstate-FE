import 'package:flutter/material.dart';
import 'package:realestate_fe/features/home/presentation/widgets/foryou/bottom_image.dart';
import 'package:realestate_fe/features/home/presentation/widgets/paying_guest/paying_banner.dart';
import 'package:realestate_fe/features/home/presentation/widgets/paying_guest/top_pics.dart';

class PayingGuest extends StatelessWidget {
  const PayingGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          PayingBanner(),
          SizedBox(height: 10),
          TopPics(),
          BottomImage(
            isForyou: false,
          ),
        ],
      ),
    );
  }
}
