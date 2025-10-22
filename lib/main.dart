import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:realestate_fe/core/bloc_providers.dart';
import 'package:realestate_fe/core/saved_hive.dart';
import 'package:realestate_fe/features/auth_user/auth_pages/splash_screen.dart';
import 'package:realestate_fe/features/profile/profile_bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");

  await Hive.initFlutter();
  await SavedHiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: appBlocProviders,
      child: Builder(
        builder: (context) {
          return BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, theme) {
              return MaterialApp(
                title: 'Pokak Real-Estate',
                debugShowCheckedModeBanner: false,
                theme: theme,
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
