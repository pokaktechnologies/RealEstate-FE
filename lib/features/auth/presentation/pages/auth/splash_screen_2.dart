import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth/presentation/pages/auth/login_screen.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Skip",
                    style: const TextStyle(
                      color: AppColors.tealBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    AppAssets.rightArrow,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppAssets.appLogo),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.center, // Centers the text over the image
              children: [
                Image.asset(
                  AppAssets.bottonDesign,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 50,
                  child: Text(
                    "Step Into Your Future Home",
                    style: TextStyle(
                      color: AppColors.mediumGray,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          customButton("Login"),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 70,
                  endIndent: 10,
                ),
              ),
              Text(
                "Or",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 10,
                  endIndent: 70,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          customButton("Sign Up"),
        ],
      ),
    );
  }

  Widget customButton(
    String name,
  ) {
    return InkWell(
      onTap: () {
        print("butotn tapped");
      },
      child: Container(
        height: 45,
        width: 320,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
