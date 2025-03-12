import 'package:flutter/material.dart';

class TestSaved extends StatelessWidget {
  const TestSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 100,
          color: Colors.red,
          child: Text(
            "saved page",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
