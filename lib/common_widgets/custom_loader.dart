import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double size;
  const AppLoadingIndicator({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: Colors.white,
      size: size,
      secondRingColor: Colors.black,
      thirdRingColor: Colors.purple,
    );
  }
}
