import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/forgot_password/forgot_password_state.dart';
import 'package:realestate_fe/features/auth/bloc/forgot_password/forgot_password_event.dart';
import 'package:realestate_fe/features/auth/pages/forgot_verificationpage.dart';
import 'package:realestate_fe/features/auth/pages/login_screen.dart';
import 'package:realestate_fe/features/auth/widgets/custom_button.dart';
import 'package:realestate_fe/features/auth/widgets/custom_textfield.dart';
import 'package:realestate_fe/features/profile/widgets/animated_error.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController emailIdTextController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? cachedEmail;

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
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
                  "Enter the email address associated with",
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
              const SizedBox(height: 40),
              CustomTextfield(
                hintText: "Enter your email",
                prefixImg: AppAssets.emailIcon,
                controller: emailIdTextController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
                listener: (context, state) {
                  if (state is ForgotPasswordOtpSent) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      FocusScope.of(context).unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotVerificationPage(
                            enteredEmailId: cachedEmail!,
                          ),
                        ),
                      );
                    });
                  } else if (state is ForgotPasswordError) {
                    FocusScope.of(context).unfocus();
                    showAnimatedError(context, "Invalid OTP or Email21", isError: true);
                  }
                },
                child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return CustomButton(
                      buttonText: state is ForgotPasswordLoading
                          ? AppLoadingIndicator()
                          : Text(
                              "Send",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          final email = emailIdTextController.text.trim();
                          cachedEmail = email;

                          context.read<ForgotPasswordBloc>().add(
                                ForgotPasswordRequestOtpEvent(email),
                              );
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
