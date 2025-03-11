import 'dart:async';
import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/features/auth/presentation/pages/splash_screen_2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timerActivate();
  }

  void timerActivate() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreenTwo(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(AppAssets.appLogo),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(AppAssets.bottonDesign, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
