import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/core/utils/navigations.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/verify-otp/verify_otp_bloc.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/verify-otp/verify_otp_event.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/verify-otp/verify_otp_state.dart';

import 'package:realestate_fe/features/auth_user/widgets/custom_button.dart';
import 'package:realestate_fe/features/home_bottom_bar/bottom_bar.dart';
import 'package:realestate_fe/features/profile/widgets/animated_error.dart';

class VerificationPage extends StatefulWidget {
  final String enteredEmailId;
  const VerificationPage({super.key, required this.enteredEmailId});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late TextEditingController otpController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }

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
                          widget.enteredEmailId,
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
                      controller: otpController,
                      autoFocus: true,
                      appContext: context,
                      length: 4,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                          onTap: () {},
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
                    BlocListener<VerifyOtpBloc, VerifyOtpState>(
                      listener: (context, state) {
                        if (state is VerifyOtpSuccess) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (context.mounted) {
                              pushAndRemoveUntilFun(context, BottomBar());
                            }
                          });
                        } else if (state is VerifyOtpError) {
                          showAnimatedError(context, state.message ?? "",
                              isError: true);
                        }
                      },
                      child: BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
                        builder: (context, state) {
                          return CustomButton(
                            buttonText: state is VerifyOtpLoading
                                ? AppLoadingIndicator()
                                : const Text(
                                    "Verify",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            onPressed: () {
                              FocusScope.of(context).unfocus(); // Hide keyboard

                              final enteredOtp = otpController.text.trim();

                              final Map<String, dynamic> verifyOtpData = {
                                "email": widget.enteredEmailId,
                                "otp": enteredOtp,
                              };

                              context
                                  .read<VerifyOtpBloc>()
                                  .add(VerifyOtpUser(verifyOtpData));
                            },
                          );
                        },
                      ),
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
