import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/forgot_password/forgot_password_bloc.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/forgot_password/forgot_password_event.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/forgot_password/forgot_password_state.dart';
import 'package:realestate_fe/features/auth_user/auth_pages/login_screen.dart';
import 'package:realestate_fe/features/auth_user/widgets/custom_button.dart';
import 'package:realestate_fe/features/auth_user/widgets/custom_textfield.dart';

import 'package:realestate_fe/features/profile/widgets/animated_error.dart';

class CreatePassword extends StatefulWidget {
  final String email;
  final int otp;
  const CreatePassword({super.key, required this.email, required this.otp});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  late TextEditingController newPasswordTextController;
  late TextEditingController confirmPasswordTextController;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    newPasswordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.dispose();
  }

  void _submitPasswordReset() {
    if (_formKey.currentState!.validate()) {
      context.read<ForgotPasswordBloc>().add(
            ForgotPasswordResetEvent(
              email: widget.email,
              otp: widget.otp,
              newPassword: newPasswordTextController.text,
            ),
          );
    }
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
      body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) async {
          if (state is ForgotPasswordLoading) {
            setState(() {
              isLoading = true;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }

          if (state is ForgotPasswordSuccess) {
            if (!mounted) return;
            showAnimatedError(context, state.message);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          } else if (state is ForgotPasswordError) {
            if (!mounted) return;

            showAnimatedError(context, "Not Updated", isError: true);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text("Create Password?",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text("Your new password must be different",
                    style: TextStyle(fontSize: 15)),
                const Text("from previously used password",
                    style: TextStyle(fontSize: 15)),
                const SizedBox(height: 40),
                CustomTextfield(
                  hintText: "New Password",
                  prefixImg: AppAssets.passwordIcon,
                  controller: newPasswordTextController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter new password";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextfield(
                  hintText: "Confirm Password",
                  prefixImg: AppAssets.passwordIcon,
                  controller: confirmPasswordTextController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm password";
                    }
                    if (value != newPasswordTextController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  buttonText: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          "Update Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  onPressed: isLoading ? null : _submitPasswordReset,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
