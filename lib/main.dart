import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/bottom_bar/bottom_bar.dart';
import 'package:realestate_fe/features/home/presentation/blocs/homepage_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomepageCubit()),
      ],
      child: MaterialApp(
        title: 'Pokak Real-Estate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: AppColors.lightGray, // Background Color
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        // home: SplashScreen(),
        home: BottomBar(),
      ),
    );
  }
}
