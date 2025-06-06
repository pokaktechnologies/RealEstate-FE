import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/login/login_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/register/register_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/verify-otp/verify_otp_bloc.dart';
import 'package:realestate_fe/features/home/presentation/blocs/homepage_cubit.dart';
import 'package:realestate_fe/features/profile/presentation/blocs/theme_bloc.dart';

List<BlocProvider> appBlocProviders = [
  BlocProvider<HomepageCubit>(create: (_) => HomepageCubit()),
  BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
  BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
  BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  BlocProvider<VerifyOtpBloc>(create: (_) => VerifyOtpBloc()),
];
