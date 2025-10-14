import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/register/register_bloc.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/register/register_event.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/register/register_state.dart';
import 'package:realestate_fe/features/auth_user/auth_pages/login_screen.dart';
import 'package:realestate_fe/features/auth_user/auth_pages/verification_code.dart';
import 'package:realestate_fe/features/auth_user/widgets/custom_button.dart';
import 'package:realestate_fe/features/auth_user/widgets/custom_textfield.dart';
import 'package:realestate_fe/features/auth_user/widgets/custom_icon.dart';
import 'package:realestate_fe/features/profile/widgets/animated_error.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameTextcontroller;
  late TextEditingController emailIdTextController;
  late TextEditingController passwordTextController;
  String? cachedEmail;
  bool isRememberMeChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameTextcontroller = TextEditingController();
    emailIdTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    nameTextcontroller.dispose();
    emailIdTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppAssets.authImg,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 180,
                      right: 10,
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
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              AppAssets.rightArrow,
                              width: 20,
                              height: 20,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      child: SizedBox(
                        width: 300,
                        child: Image.asset(AppAssets.whitepokaklogo),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Create Your Account",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome!",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                ),
                child: CustomTextfield(
                  hintText: "Enter your Name",
                  prefixImg: AppAssets.usernameIcon,
                  controller: nameTextcontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.trim().length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                ),
                child: CustomTextfield(
                    hintText: "Enter your Email",
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
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                ),
                child: CustomTextfield(
                  hintText: "Password",
                  prefixImg: AppAssets.passwordIcon,
                  controller: passwordTextController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: isRememberMeChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isRememberMeChecked = newValue!;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      "Remember me",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40,
                  left: 40,
                  top: 20,
                ),
                child: BlocListener<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess && cachedEmail != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        FocusScope.of(context).unfocus();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VerificationPage(enteredEmailId: cachedEmail!),
                          ),
                        );
                        showAnimatedError(context, state.message);
                      });
                    } else if (state is RegisterError) {
                      FocusScope.of(context).unfocus();
                      showAnimatedError(context, state.message, isError: true);
                    }
                  },
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return CustomButton(
                        buttonText: state is RegisterLoading
                            ? AppLoadingIndicator()
                            : Text(
                                "Sign Up",
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
                            final name = nameTextcontroller.text.trim();
                            final password = passwordTextController.text.trim();

                            final registerData = {
                              "email": email,
                              "name": name,
                              "password": password,
                            };

                            cachedEmail = email;
                            context
                                .read<RegisterBloc>()
                                .add(RegisterUser(registerData));
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
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
                    "Or Continue with ",
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
              Padding(
                padding: const EdgeInsets.only(
                  right: 55,
                  left: 55,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIcon(
                      assetImg: AppAssets.googleIcon,
                    ),
                    CustomIcon(
                      assetImg: AppAssets.facebookIcon,
                    ),
                    CustomIcon(
                      assetImg: AppAssets.appleIcon,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
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
                        color: AppColors.black,
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
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
