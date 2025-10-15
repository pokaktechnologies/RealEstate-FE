// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:realestate_fe/core/utils/app_colors.dart';
// import 'package:realestate_fe/core/utils/navigations.dart';
// import 'package:realestate_fe/features/auth/pages/login_screen.dart';
// import 'package:realestate_fe/features/profile/blocs/logout/logout_bloc.dart';
// import 'package:realestate_fe/features/profile/blocs/logout/logout_event.dart';
// import 'package:realestate_fe/features/profile/blocs/logout/logout_state.dart';
// import 'package:realestate_fe/features/profile/widgets/animated_error.dart';

// void showLogoutPopup(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext dialogContext) {
//       return BlocProvider.value(
//         value: context.read<LogoutBloc>(),
//         child: AlertDialog(
//           backgroundColor: AppColors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
//           titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
//           title: const Text(
//             "Are you sure you want to log out?",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           content: const Text(
//             "You will need to enter your credentials to log in again",
//             style: TextStyle(
//               fontSize: 14,
//               color: AppColors.mediumGray,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           actionsPadding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(dialogContext);
//               },
//               child: const Text(
//                 "Cancel",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w900,
//                   color: AppColors.mediumGray,
//                 ),
//               ),
//             ),
//             BlocListener<LogoutBloc, LogoutState>(
//               listener: (context, state) {
//                 if (state is LogoutSuccess) {
//                   showAnimatedError(context, state.message);
//                   Navigator.pop(dialogContext);
//                   pushAndRemoveUntilFun(context, LoginScreen());
//                 } else if (state is LogoutError) {
//                   showAnimatedError(context, state.error ?? 'Unknown Error',
//                       isError: true);
//                 }
//               },
//               child: BlocBuilder<LogoutBloc, LogoutState>(
//                 builder: (context, state) {
//                   return TextButton(
//                     onPressed: state is LogoutLoading
//                         ? null
//                         : () {
//                             context.read<LogoutBloc>().add(LogoutUser());
//                           },
//                     child: state is LogoutLoading
//                         ? const SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(strokeWidth: 2),
//                           )
//                         : const Text(
//                             "Logout",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w900,
//                               color: AppColors.tealBlue,
//                             ),
//                           ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/core/utils/navigations.dart';
import 'package:realestate_fe/features/auth_user/auth_pages/login_screen.dart';
import 'package:realestate_fe/features/profile/profile_bloc/logout/logout_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/logout/logout_event.dart';
import 'package:realestate_fe/features/profile/profile_bloc/logout/logout_state.dart';
import 'package:realestate_fe/features/profile/widgets/animated_error.dart';

void showLogoutPopup(BuildContext parentContext) {
  showDialog(
    context: parentContext,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return BlocProvider.value(
        value: parentContext.read<LogoutBloc>(),
        child: AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
          titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          title: const Text(
            "Are you sure you want to log out?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          content: const Text(
            "You will need to enter your credentials to log in again",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mediumGray,
              fontWeight: FontWeight.w400,
            ),
          ),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
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
                  showAnimatedError(parentContext, state.message);
                  Navigator.pop(dialogContext);
                  pushAndRemoveUntilFun(parentContext, LoginScreen());
                } else if (state is LogoutError) {
                  showAnimatedError(
                      parentContext, state.error ?? 'Unknown Error',
                      isError: true);
                }
              },
              child: BlocBuilder<LogoutBloc, LogoutState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: state is LogoutLoading
                        ? null
                        : () {
                            context.read<LogoutBloc>().add(LogoutUser());
                          },
                    child: state is LogoutLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
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
        ),
      );
    },
  );
}
