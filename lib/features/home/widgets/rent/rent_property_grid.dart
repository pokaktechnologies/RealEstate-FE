import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/home/widgets/rent/rent_card.dart';
import 'package:realestate_fe/models/dummy_rent_grid_model.dart';

class RentedPropertyGridScreen extends StatefulWidget {
  const RentedPropertyGridScreen({super.key});

  @override
  State<RentedPropertyGridScreen> createState() =>
      _RentedPropertyGridScreenState();
}

class _RentedPropertyGridScreenState extends State<RentedPropertyGridScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _itemAnimations;

  final int _itemsCount = sampleData.length;
  final Duration _totalDuration = const Duration(milliseconds: 1600);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _totalDuration);
    _itemAnimations = List.generate(_itemsCount, (index) {
      final double start = (index * 0.08).clamp(0.0, 0.8);
      final double end = (start + 0.45).clamp(0.0, 1.0);
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width > 700 ? 3 : 2;

    return Container(
      color: AppColors.lightGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // InkWell(
                //   onTap: () {
                //     //Navigator.pop(context);
                //   },
                //   child: Image.asset(AppAssets.arrowbackIcon),
                // ),
                // IconButton(
                //   onPressed: () => _controller.forward(from: 0),
                //   icon: const Icon(Icons.refresh),
                // ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _itemsCount,
              itemBuilder: (context, index) {
                final item = sampleData[index];
                final animation = _itemAnimations[index];

                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    final double offsetY = (1 - animation.value) * -40;
                    final double opacity = animation.value;
                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, offsetY),
                        child: child,
                      ),
                    );
                  },
                  child: RentCard(item: item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
