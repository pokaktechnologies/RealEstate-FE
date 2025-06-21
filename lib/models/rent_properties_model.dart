class RentPropertiesModel {
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

  RentPropertiesModel({
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
  });

  factory RentPropertiesModel.fromJson(Map<String, dynamic> json) =>
      RentPropertiesModel(
        id: json['id'] ?? 0,
        userId: json['user'] ?? 0,
        name: json['name'] ?? '',
        country: json['country'] ?? '',
        state: json['state'] ?? '',
        city: json['city'] ?? '',
        listing: json['listing'] ?? false,
        status: json['status'] ?? '',
        price: json['price'] ?? '',
        priceType: json['price_type'] ?? '',
        category: json['category'] ?? '',
        propertyType: json['property_type'] ?? '',
        preferredOccupants: json['preferred_occupants'] ?? '',
        overallRatings: json['overall_rating'] ?? 0.0,
        reviewCount: json['review_count'] ?? 0,
        isPropertySaved: json['is_property_saved'] ?? false,
      );

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
