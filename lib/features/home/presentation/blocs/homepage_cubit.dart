import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/bottom_bar/test_deals.dart';
import 'package:realestate_fe/features/bottom_bar/test_message.dart';
import 'package:realestate_fe/features/bottom_bar/test_profile.dart';

class HomepageCubit extends Cubit<int> {
  HomepageCubit() : super(0);

  void changeTab(int index) {
    emit(index);
  }

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return TestDeals();
      case 1:
        return TestMessage();
      case 2:
        return TestProfile();
      case 3:
        return TestProfile();
      default:
        return TestDeals();
    }
  }
}
