class SavedPropertyModel {
  final int savedId;
  final String name;
  final String city;
  final String state;
  final String? image;
  final double price;
  final String priceType;

  SavedPropertyModel({
    required this.savedId,
    required this.name,
    required this.city,
    required this.state,
    this.image,
    required this.price,
    required this.priceType,
  });

  factory SavedPropertyModel.fromJson(Map<String, dynamic> json) {
    return SavedPropertyModel(
      savedId: json['id'],
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      image: (json['images'] != null && json['images'].isNotEmpty)
          ? json['images'][0]['image']
          : null,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      priceType: json['price_type'] ?? '',
    );
  }
}
