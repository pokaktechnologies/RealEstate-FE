import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class RealEstate {
  final String title;
  final String location;
  final String price;
  final String imageUrl;
  final double rating;
  final int ratingCount;

  RealEstate({
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
  });
}

final List<RealEstate> sampleData = List.generate(
  8,
  (i) => RealEstate(
    title: 'Cozy Home ${i + 1}',
    location: 'City ${i + 1}',
    price: '\$${(120 + i * 25)}k',
    imageUrl: 'https://picsum.photos/seed/house${i + 1}/400/300',
    rating: 3.5 + (i % 2 == 0 ? 0.3 : 0.7),
    ratingCount: 50 + i * 10,
  ),
);

class AnimatedRealEstateGrid extends StatefulWidget {
  const AnimatedRealEstateGrid({super.key});

  @override
  State<AnimatedRealEstateGrid> createState() => _AnimatedRealEstateGridState();
}

class _AnimatedRealEstateGridState extends State<AnimatedRealEstateGrid>
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
                IconButton(
                  onPressed: () => _controller.forward(from: 0),
                  icon: const Icon(Icons.refresh),
                ),
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
                  child: RealEstateCard(item: item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RealEstateCard extends StatelessWidget {
  final RealEstate item;
  const RealEstateCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: AppColors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.grey.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: Icon(Icons.home, size: 40)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.price,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(children: [
                          RatingBar.builder(
                            // initialRating: item.rating,
                            initialRating: 4.3,

                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 1,
                            ignoreGestures: true,
                            itemSize: 14,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColors.ratingColor,
                            ),
                            onRatingUpdate: (_) {},
                          ),
                          Text(
                            // item.ratingCount.toStringAsFixed(1),
                            "129",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ])

                        //----------------
                      ]),
                  const SizedBox(height: 5),
                  Text(item.location,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12)),
                  Row(
                    children: [
                      const SizedBox(width: 6),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
