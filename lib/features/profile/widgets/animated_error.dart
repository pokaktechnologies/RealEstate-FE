import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

void showAnimatedError(BuildContext context, String message,
    {bool isError = false}) {
  final overlay = Overlay.of(context);
  final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

  final overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        bottom: keyboardHeight > 0 ? keyboardHeight + 20 : 50,
        left: 20,
        right: 20,
        child: AnimatedErrorBubble(message: message, isError: isError),
      );
    },
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

class AnimatedErrorBubble extends StatefulWidget {
  final String message;
  final bool isError;

  const AnimatedErrorBubble({
    super.key,
    required this.message,
    this.isError = false,
  });

  @override
  State<AnimatedErrorBubble> createState() => _AnimatedErrorBubbleState();
}

class _AnimatedErrorBubbleState extends State<AnimatedErrorBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: widget.isError ? Colors.red : null,
            gradient: widget.isError
                ? null
                : LinearGradient(
                    colors: [
                      AppColors.tealBlue,
                      AppColors.aquaTeal,
                      AppColors.tealBlue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Material(
            color: Colors.transparent,
            elevation: 6,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.isError
                        ? Icons.error_outline
                        : Icons.check_circle_outline,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      widget.message,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
