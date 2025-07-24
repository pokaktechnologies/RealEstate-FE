import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/forgot_password/forgot_password_event.dart';
import 'package:realestate_fe/features/auth/bloc/forgot_password/forgot_password_state.dart';
import 'package:realestate_fe/features/auth/pages/create_password.dart';
import 'package:realestate_fe/features/auth/widgets/custom_button.dart';
import 'package:realestate_fe/features/profile/widgets/animated_error.dart';

class ForgotVerificationPage extends StatefulWidget {
  final String enteredEmailId;

  const ForgotVerificationPage({super.key, required this.enteredEmailId});

  @override
  State<ForgotVerificationPage> createState() => _ForgotVerificationPageState();
}

class _ForgotVerificationPageState extends State<ForgotVerificationPage> {
  late TextEditingController otpController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
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
              padding: const EdgeInsets.all(20),
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
                        "We sent you an OTP to your mail",
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
                          style: const TextStyle(
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
                        const Text(
                          "Don't receive any code? ",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
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
                    BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
                      listener: (context, state) {
                        if (state is ForgotPasswordOtpVerified) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CreatePassword(
                                    email: widget.enteredEmailId,
                                    otp: int.parse(otpController.text.trim()),
                                  ),
                                ),
                              );
                            }
                          });
                        } else if (state is ForgotPasswordError) {
                          showAnimatedError(context, state.error,
                              isError: true);
                        }
                      },
                      child:
                          BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                        builder: (context, state) {
                          return CustomButton(
                            buttonText: state is ForgotPasswordLoading
                                ? const AppLoadingIndicator()
                                : const Text(
                                    "Verify",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              final enteredOtp = otpController.text.trim();
                              if (enteredOtp.isEmpty) return;

                              context.read<ForgotPasswordBloc>().add(
                                    ForgotPasswordVerifyOtpEvent(
                                      widget.enteredEmailId,
                                      int.parse(enteredOtp),
                                    ),
                                  );
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
