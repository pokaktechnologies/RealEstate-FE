import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth/pages/login_screen.dart';
import 'package:realestate_fe/features/auth/pages/verification_code.dart';
import 'package:realestate_fe/features/auth/widgets/custom_button.dart';
import 'package:realestate_fe/features/auth/widgets/custom_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController emailIdTextController;

  @override
  void initState() {
    super.initState();
    emailIdTextController = TextEditingController();
  }

  @override
  void dispose() {
    emailIdTextController.dispose();
    super.dispose();
  }

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
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "Enter the email address assosiated with",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Center(
              child: Text(
                "your account",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextfield(
              hintText: "Enter your email",
              prefixImg: AppAssets.emailIcon,
              controller: emailIdTextController,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              buttonText: Text(
                "Send",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationPage(
                      enteredEmailId: emailIdTextController.text,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: "Remember Password? ",
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: "Login",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.tealBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
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
          ],
        ),
      ),
    );
  }
}
