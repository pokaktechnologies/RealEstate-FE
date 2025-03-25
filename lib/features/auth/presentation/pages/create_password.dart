import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth/presentation/pages/login_screen.dart';
import 'package:realestate_fe/features/auth/presentation/widgets/custom_button.dart';
import 'package:realestate_fe/features/auth/presentation/widgets/custom_textfield.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.backArrow),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35.0, right: 35.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Create Password?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Your new password must be different",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Center(
              child: Text(
                "from previously used password",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextfield(
              hintText: "New Password",
              prefixImg: AppAssets.passwordIcon,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextfield(
              hintText: "Confirm Password",
              prefixImg: AppAssets.passwordIcon,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              buttonText: "Update password",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
