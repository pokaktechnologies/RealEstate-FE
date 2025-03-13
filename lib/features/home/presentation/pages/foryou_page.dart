import 'package:flutter/material.dart';
import 'package:realestate_fe/features/home/presentation/widgets/foryou/banner.dart';

class ForyouPage extends StatelessWidget {
  const ForyouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        SponsoredScreen()
      ],
    );
  }
}