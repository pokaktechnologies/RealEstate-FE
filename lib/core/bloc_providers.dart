import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/login/login_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/register/register_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/verify-otp/verify_otp_bloc.dart';
import 'package:realestate_fe/features/home/presentation/blocs/homepage_cubit.dart';
import 'package:realestate_fe/features/profile/blocs/profile/profile_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/state/state_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/theme_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/country/country_bloc.dart';

List<BlocProvider> appBlocProviders = [
  BlocProvider<HomepageCubit>(create: (_) => HomepageCubit()),
  BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
  BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
  BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  BlocProvider<VerifyOtpBloc>(create: (_) => VerifyOtpBloc()),
  BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
  BlocProvider<CountryBloc>(create: (_) => CountryBloc()),
  BlocProvider<StateBloc>(create: (_) => StateBloc()),
];
