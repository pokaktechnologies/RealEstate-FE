class PropertyDetailsModel {
  final int id;
  final List<PropertyImage> images;
  final List<KeyFeature> keyFeatures;
  final List<NearestFacility> nearestFacilities;
  final String countryName;
  final String stateName;
  final String cityName;
  final String categoryDisplay;
  final String propertyTypeDisplay;
  final String preferredOccupantsDisplay;
  final String priceTypeDisplay;
  final double overallRating;
  final bool isPropertySaved;
  final double? dealPrice;
  final double? dealDiscountPercentage;
  final bool hasActiveDeal;
  final String name;
  final String category;
  final String propertyType;
  final String preferredOccupants;
  final String? zipcode;
  final String? nearestLandmark;
  final double? latitude;
  final double? longitude;
  final String? propertyDescription;
  final int? bedroomCount;
  final int? bathroomCount;
  final int? sharedRoomCount;
  final int price;
  final String priceType;
  final int securityDeposit;
  final String? paymentReceivingMode;
  final int serviceFee;
  final bool listing;
  final String status;
  final String? propertyRule;
  final String contactNumber;
  final String? contactEmail;
  final String createdAt;
  final String storedRating;
  final int reviewCount;
  final int user;
  final int country;
  final int state;
  final int city;

  PropertyDetailsModel({
    required this.id,
    required this.images,
    required this.keyFeatures,
    required this.nearestFacilities,
    required this.countryName,
    required this.stateName,
    required this.cityName,
    required this.categoryDisplay,
    required this.propertyTypeDisplay,
    required this.preferredOccupantsDisplay,
    required this.priceTypeDisplay,
    required this.overallRating,
    required this.isPropertySaved,
    this.dealPrice,
    this.dealDiscountPercentage,
    required this.hasActiveDeal,
    required this.name,
    required this.category,
    required this.propertyType,
    required this.preferredOccupants,
    this.zipcode,
    this.nearestLandmark,
    this.latitude,
    this.longitude,
    this.propertyDescription,
    this.bedroomCount,
    this.bathroomCount,
    this.sharedRoomCount,
    required this.price,
    required this.priceType,
    required this.securityDeposit,
    this.paymentReceivingMode,
    required this.serviceFee,
    required this.listing,
    required this.status,
    this.propertyRule,
    required this.contactNumber,
    this.contactEmail,
    required this.createdAt,
    required this.storedRating,
    required this.reviewCount,
    required this.user,
    required this.country,
    required this.state,
    required this.city,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
    return PropertyDetailsModel(
      id: json['id'],
      images: (json['images'] as List)
          .map((e) => PropertyImage.fromJson(e))
          .toList(),
      keyFeatures: (json['key_features'] as List)
          .map((e) => KeyFeature.fromJson(e))
          .toList(),
      nearestFacilities: (json['nearest_facility'] as List)
          .map((e) => NearestFacility.fromJson(e))
          .toList(),
      countryName: json['country_name'] ?? '',
      stateName: json['state_name'] ?? '',
      cityName: json['city_name'] ?? '',
      categoryDisplay: json['category_display'] ?? '',
      propertyTypeDisplay: json['property_type_display'] ?? '',
      preferredOccupantsDisplay: json['preferred_occupants_display'] ?? '',
      priceTypeDisplay: json['price_type_display'] ?? '',
      overallRating: (json['overall_rating'] ?? 0).toDouble(),
      isPropertySaved: json['is_property_saved'] ?? false,
      dealPrice: json['deal_price'] != null
          ? double.tryParse(json['deal_price'].toString())
          : null,
      dealDiscountPercentage: json['deal_discount_percentage'] != null
          ? double.tryParse(json['deal_discount_percentage'].toString())
          : null,
      hasActiveDeal: json['has_active_deal'] ?? false,
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      propertyType: json['property_type'] ?? '',
      preferredOccupants: json['preferred_occupants'] ?? '',
      zipcode: json['zipcode'],
      nearestLandmark: json['nearest_landmark'],
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      propertyDescription: json['property_description'],
      bedroomCount: json['bedroom_count'],
      bathroomCount: json['bathroom_count'],
      sharedRoomCount: json['shared_room_count'],
      price: json['price'],
      priceType: json['price_type'] ?? '',
      securityDeposit: json['security_deposit'],
      paymentReceivingMode: json['payment_receiving_mode'],
      serviceFee: json['service_fee'],
      listing: json['listing'],
      status: json['status'] ?? '',
      propertyRule: json['property_rule'],
      contactNumber: json['contact_number'] ?? '',
      contactEmail: json['contact_email'],
      createdAt: json['created_at'] ?? '',
      storedRating: json['stored_rating'] ?? '',
      reviewCount: json['review_count'],
      user: json['user'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
    );
  }
}

class PropertyImage {
  final int id;
  final String image;

  PropertyImage({required this.id, required this.image});

  factory PropertyImage.fromJson(Map<String, dynamic> json) {
    return PropertyImage(
      id: json['id'],
      image: json['image'],
    );
  }
}

class KeyFeature {
  final String key;
  final String label;
  final String icon;
  final String flutterIcon;

  KeyFeature({
    required this.key,
    required this.label,
    required this.icon,
    required this.flutterIcon,
  });

  factory KeyFeature.fromJson(Map<String, dynamic> json) {
    return KeyFeature(
      key: json['key'],
      label: json['label'],
      icon: json['icon'],
      flutterIcon: json['flutter_icon'],
    );
  }
}

class NearestFacility {
  final String key;
  final String label;
  final String icon;
  final String flutterIcon;

  NearestFacility({
    required this.key,
    required this.label,
    required this.icon,
    required this.flutterIcon,
  });

  factory NearestFacility.fromJson(Map<String, dynamic> json) {
    return NearestFacility(
      key: json['key'],
      label: json['label'],
      icon: json['icon'],
      flutterIcon: json['flutter_icon'],
    );
  }
}
