class IdealPgModel {
  int id;
  int userId;
  String name;
  String country;
  String state;
  String city;
  bool listing;
  String status;
  int price;
  String priceType;
  String category;
  String propertyType;
  String preferredOccupants;
  double overallRatings;
  int reviewCount;
  bool isPropertySaved;
  double? dealPrice;
  double? dealDiscountPercentage;
  bool hasActiveDeal;
  double? latitude;
  double? longitude;
  List<ImageModel> images;
  List<KeyFeatureModel> keyFeatures;

  IdealPgModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.country,
    required this.state,
    required this.city,
    required this.listing,
    required this.status,
    required this.price,
    required this.priceType,
    required this.category,
    required this.propertyType,
    required this.preferredOccupants,
    required this.overallRatings,
    required this.reviewCount,
    required this.isPropertySaved,
    this.dealPrice,
    this.dealDiscountPercentage,
    required this.hasActiveDeal,
    this.latitude,
    this.longitude,
    required this.images,
    required this.keyFeatures,
  });

  factory IdealPgModel.fromJson(Map<String, dynamic> json) {
    return IdealPgModel(
      id: json['id'] ?? 0,
      userId: json['user'] ?? 0,
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      listing: json['listing'] ?? false,
      status: json['status'] ?? '',
      price: json['price'] ?? 0,
      priceType: json['price_type'] ?? '',
      category: json['category'] ?? '',
      propertyType: json['property_type'] ?? '',
      preferredOccupants: json['preferred_occupants'] ?? '',
      overallRatings: (json['overall_rating'] ?? 0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      isPropertySaved: json['is_property_saved'] ?? false,
      dealPrice: json['deal_price'] != null
          ? (json['deal_price'] as num).toDouble()
          : null,
      dealDiscountPercentage: json['deal_discount_percentage'] != null
          ? (json['deal_discount_percentage'] as num).toDouble()
          : null,
      hasActiveDeal: json['has_active_deal'] ?? false,
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      images: (json['images'] as List<dynamic>?)
              ?.map((img) => ImageModel.fromJson(img))
              .toList() ??
          [],
      keyFeatures: (json['key_features'] as List<dynamic>?)
              ?.map((kf) => KeyFeatureModel.fromJson(kf))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": userId,
        "name": name,
        "country": country,
        "state": state,
        "city": city,
        "listing": listing,
        "status": status,
        "price": price,
        "price_type": priceType,
        "category": category,
        "property_type": propertyType,
        "preferred_occupants": preferredOccupants,
        "overall_rating": overallRatings,
        "review_count": reviewCount,
        "is_property_saved": isPropertySaved,
        "deal_price": dealPrice,
        "deal_discount_percentage": dealDiscountPercentage,
        "has_active_deal": hasActiveDeal,
        "latitude": latitude,
        "longitude": longitude,
        "images": images.map((e) => e.toJson()).toList(),
        "key_features": keyFeatures.map((e) => e.toJson()).toList(),
      };
}

class ImageModel {
  int imageId;
  String imageName;

  ImageModel({
    required this.imageId,
    required this.imageName,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        imageId: json['id'] ?? 0,
        imageName: json['image'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'id': imageId,
        'image': imageName,
      };
}

class KeyFeatureModel {
  String key;
  String label;
  String icon;

  KeyFeatureModel({
    required this.key,
    required this.label,
    required this.icon,
  });

  factory KeyFeatureModel.fromJson(Map<String, dynamic> json) =>
      KeyFeatureModel(
        key: json['key'] ?? '',
        label: json['label'] ?? '',
        icon: json['icon'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'label': label,
        'icon': icon,
      };
}
