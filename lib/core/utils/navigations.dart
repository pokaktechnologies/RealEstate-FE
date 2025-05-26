import 'package:flutter/material.dart';

void pushNavigation(BuildContext context, Widget navPage) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => navPage,
    ),
  );
}

void pushAndRemoveUntilFun(BuildContext context, Widget navPage) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => navPage,
    ),
    (route) => false,
  );
}

void pushReplacementNavigation(BuildContext context, Widget navPage) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => navPage,
    ),
  );
}
