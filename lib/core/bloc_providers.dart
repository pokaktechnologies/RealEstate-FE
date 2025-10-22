import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/forgot_password/forgot_password_bloc.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/login/login_bloc.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/register/register_bloc.dart';
import 'package:realestate_fe/features/auth_user/auth_bloc/verify-otp/verify_otp_bloc.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_bloc.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_bloc.dart';
import 'package:realestate_fe/features/home_category/category_bloc/category_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/logout/logout_bloc.dart';
import 'package:realestate_fe/features/home/home_bloc/homepage_cubit.dart';
import 'package:realestate_fe/features/profile/profile_bloc/contact/contact_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/personal_info/personalinfo_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/profile/profile_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/state/state_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/theme_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/country/country_bloc.dart';
import 'package:realestate_fe/features/property_details/property_detail_bloc/propertydetails_bloc.dart';
import 'package:realestate_fe/features/property_details/review_bloc/reviews_bloc.dart';
import 'package:realestate_fe/services/category/category_repository.dart';
import 'package:realestate_fe/services/deal/deals_repository.dart';
import 'package:realestate_fe/services/home/home_repository.dart';
import 'package:realestate_fe/services/profile/profile_repository.dart';
import 'package:realestate_fe/services/property/property_repository.dart';
import 'package:realestate_fe/services/reviews/reviews_repository.dart';

final HomeRepository _homeRepository = HomeRepository();
final PropertyRepository _propertyRepository = PropertyRepository();
final ProfileRepository _profileRepository = ProfileRepository();
final DealRepository _dealRepository = DealRepository();
final ReviewRepository _reviewRepository = ReviewRepository();
final CategoryRepository _categoryRepository = CategoryRepository();

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
  BlocProvider<ForgotPasswordBloc>(create: (_) => ForgotPasswordBloc()),
  BlocProvider<PropertydetailsBloc>(
      create: (_) => PropertydetailsBloc(_propertyRepository)),
  BlocProvider<PersonalinfoBloc>(
      create: (_) => PersonalinfoBloc(_profileRepository)),
  BlocProvider<DealBloc>(create: (_) => DealBloc(_dealRepository)),
  BlocProvider<ReviewsBloc>(create: (_) => ReviewsBloc(_reviewRepository)),
  BlocProvider<CategoryBloc>(create: (_) => CategoryBloc(_categoryRepository)),
];
