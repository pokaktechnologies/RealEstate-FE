import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/login/login_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/register/register_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/verify-otp/verify_otp_bloc.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/logout/logout_bloc.dart';
import 'package:realestate_fe/features/home/blocs/homepage_cubit.dart';
import 'package:realestate_fe/features/profile/blocs/contact/contact_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/profile/profile_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/state/state_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/theme_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/country/country_bloc.dart';
import 'package:realestate_fe/services/home/home_repository.dart';

final HomeRepository _homeRepository = HomeRepository();

List<BlocProvider> appBlocProviders = [
  BlocProvider<HomepageCubit>(create: (_) => HomepageCubit()),
  BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
  BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
  BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  BlocProvider<VerifyOtpBloc>(create: (_) => VerifyOtpBloc()),
  BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
  BlocProvider<LogoutBloc>(create: (_) => LogoutBloc()),
  BlocProvider<CountryBloc>(create: (_) => CountryBloc()),
  BlocProvider<StateBloc>(create: (_) => StateBloc()),
  BlocProvider<ContactBloc>(create: (_) => ContactBloc()),
  BlocProvider<PropertiesBloc>(create: (_) => PropertiesBloc(_homeRepository)),
];
