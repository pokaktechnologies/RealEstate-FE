import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/home/blocs/pages/foryou_page.dart';
import 'package:realestate_fe/features/home/pages/buy_page.dart';
import 'package:realestate_fe/features/home/pages/paying_guest.dart';
import 'package:realestate_fe/features/home/pages/rent_page.dart';

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
        return RentPage();
      case 2:
        return BuyPage();
      case 3:
        return PayingGuest();
      default:
        return ForyouPage();
    }
  }
}
