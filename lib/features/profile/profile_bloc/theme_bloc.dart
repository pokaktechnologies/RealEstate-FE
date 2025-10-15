import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Cubit<ThemeData> {
  ThemeBloc()
      : super(ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.lightGray,
        )) {
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode ? ThemeData.dark() : ThemeData.light());
  }

  void _saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  void toggleTheme() {
    bool isDarkMode = state.brightness == Brightness.light;
    ThemeData newTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
    emit(newTheme);
    _saveTheme(isDarkMode);
  }
}
