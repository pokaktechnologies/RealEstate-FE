import 'dart:async';
import 'package:flutter/material.dart';
import 'package:realestate_fe/core/services.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth_user/auth_pages/splash_screen_2.dart';

import 'package:realestate_fe/features/bottom_bar/bottom_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorageService _secureStorage = SecureStorageService();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    final token = await _secureStorage.getToken();
    if (!mounted) return;
    if (token != null && token.isNotEmpty) {
      // User logged in → go to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomBar()),
      );
    } else {
      // Not logged in → go to SplashScreenTwo
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreenTwo()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                AppAssets.pokaklogo,
                width: 300,
              ),
            ),
          ),
          Image.asset(
            AppAssets.bottonDesign,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
