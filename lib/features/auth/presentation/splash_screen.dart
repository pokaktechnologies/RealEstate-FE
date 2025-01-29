import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppAssets.appLogo),
          ),
          Center(
            child: Image.asset(AppAssets.authBottomDesign),
          ),
        ],
      ),
    );
  }
}
