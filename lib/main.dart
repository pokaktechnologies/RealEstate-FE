import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/bottom_bar/bottom_bar.dart';
import 'package:realestate_fe/features/home/presentation/blocs/homepage_cubit.dart';
import 'package:realestate_fe/features/profile/presentation/blocs/theme_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
            home: BottomBar(),
          );
        },
      ),
    );
  }
}
