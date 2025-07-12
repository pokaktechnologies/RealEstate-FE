import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/common_widgets/custom_loader.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/core/utils/navigations.dart';
import 'package:realestate_fe/features/auth/pages/login_screen.dart';
import 'package:realestate_fe/features/profile/blocs/logout/logout_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/logout/logout_event.dart';
import 'package:realestate_fe/features/profile/blocs/logout/logout_state.dart';

void showLogoutPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
        titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        title: Text(
          "Are you sure you want to log out?",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        content: const Text(
          "You will need to enter your credentials to log in again",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.mediumGray,
            fontWeight: FontWeight.w400,
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: AppColors.mediumGray,
              ),
            ),
          ),
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                Navigator.pop(context);
                pushAndRemoveUntilFun(context, LoginScreen());
              }

              if (state is LogoutError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error ?? 'Unknown error')),
                );
              }
            },
            child: BlocBuilder<LogoutBloc, LogoutState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    context.read<LogoutBloc>().add(LogoutUser());
                    Navigator.pop(context);
                  },
                  child: state is LogoutLoading
                      ? AppLoadingIndicator()
                      : const Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: AppColors.tealBlue,
                          ),
                        ),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
