import 'package:flutter/material.dart';
import 'package:realestate_fe/features/home/presentation/widgets/foryou/banner.dart';
import 'package:realestate_fe/features/home/presentation/widgets/foryou/stay_finder_screen.dart';

class ForyouPage extends StatelessWidget {
  const ForyouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          SponsoredScreen(),
          SizedBox(height: 15),
          StayFinderScreen(),
        ],
      ),
    );
  }
}
