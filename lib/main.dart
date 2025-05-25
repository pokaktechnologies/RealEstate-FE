import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:realestate_fe/features/auth/pages/splash_screen.dart';
import 'package:realestate_fe/features/home/presentation/blocs/homepage_cubit.dart';
import 'package:realestate_fe/features/profile/presentation/blocs/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomepageCubit()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Pokak Real-Estate',
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
