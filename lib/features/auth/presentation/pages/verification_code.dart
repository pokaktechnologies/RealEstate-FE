import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth/presentation/pages/create_password.dart';
import 'package:realestate_fe/features/auth/presentation/widgets/custom_button.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({
    super.key,
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 90),
            Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const Center(
                      child: Text(
                        "Verification Code",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "We send you an OTP to your mail",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "alanjohn@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        Image.asset(
                          AppAssets.authvector,
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 64,
                        fieldWidth: 70,
                        activeFillColor: AppColors.white,
                        inactiveFillColor: AppColors.white,
                        selectedFillColor: AppColors.white,
                        activeColor: AppColors.tealBlue,
                        inactiveColor: AppColors.tealBlue,
                        selectedColor: AppColors.tealBlue,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textStyle: const TextStyle(fontSize: 20),
                      onCompleted: (value) {},
                      onChanged: (value) {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't receive any code? ",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Resend OTP logic
                          },
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: AppColors.tealBlue,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      buttonText: "Verify",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreatePassword(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
