import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/bottom_bar/test_profile.dart';
import 'package:realestate_fe/features/home/presentation/pages/foryou_page.dart';
import 'package:realestate_fe/features/message/presentation/pages/message.dart';

class HomepageCubit extends Cubit<int> {
  HomepageCubit() : super(0);

  void changeTab(int index) {
    emit(index);
  }

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return ForyouPage();
      case 1:
        return MessageScreen();
      case 2:
        return TestProfile();
      case 3:
        return TestProfile();
      default:
        return ForyouPage();
    }
  }
}
