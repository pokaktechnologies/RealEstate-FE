import 'package:flutter/material.dart';
import 'package:realestate_fe/features/home/presentation/widgets/rent/rent_banner.dart';

class RentPage extends StatelessWidget {
  const RentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          RentBanner(),
        ],
      ),
    );
  }
}
