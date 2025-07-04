import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/core/utils/navigations.dart';
import 'package:realestate_fe/features/auth/bloc/login/login_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/login/login_event.dart';
import 'package:realestate_fe/features/auth/bloc/login/login_state.dart';
import 'package:realestate_fe/features/auth/pages/forgot_password.dart';
import 'package:realestate_fe/features/auth/pages/signup_screen.dart';
import 'package:realestate_fe/features/auth/widgets/custom_button.dart';
import 'package:realestate_fe/features/auth/widgets/custom_icon.dart';
import 'package:realestate_fe/features/auth/widgets/custom_textfield.dart';
import 'package:realestate_fe/features/bottom_bar/bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailIdTextController;
  late TextEditingController passwordTextController;

  @override
  void initState() {
    super.initState();
    emailIdTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    emailIdTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
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
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                          (route) => false,
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
              "Login!",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Welcome back!",
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
                hintText: "Enter Your Email",
                prefixImg: AppAssets.emailIcon,
                controller: emailIdTextController,
              ),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 40,
                left: 20,
                top: 15,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: Text(
                    "forgot password?",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 40,
                left: 40,
                top: 20,
              ),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    pushAndRemoveUntilFun(context, BottomBar());
                  }

                  if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error ?? 'Unknown error')),
                    );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CustomButton(
                      buttonText: state is LoginLoading
                          ? AppLoadingIndicator()
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      onPressed: () {
                        final Map<String, dynamic> loginData = {
                          "email": emailIdTextController.text,
                          "password": passwordTextController.text,
                        };
                        context.read<LoginBloc>().add(LoginUser(loginData));
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
                text: "Dont have an account? ",
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: "Signup",
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
                            builder: (context) => SignupScreen(),
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
