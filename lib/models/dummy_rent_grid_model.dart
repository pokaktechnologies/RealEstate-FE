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
