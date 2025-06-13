class CountryModel {
  String? error;
  List<Country>? data;
  CountryModel({this.data});
  
  CountryModel.withError(String errorMessage) {
    error = errorMessage;
  }
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      data: json['data'] != null
          ? List<Country>.from(json['data'].map((x) => Country.fromJson(x)))
          : [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((x) => x.toJson()).toList(),
    };
  }
}

class Country {
  final int countryId;
  final String countryName;
  final String nationality;
  final int phonecode;
  final String currency;
  final String currencyName;
  final String currencySymbol;
  final String iso3;
  final String emoji;
  final String emojiU;
  final String latitude;
  final String longitude;

  Country({
    required this.countryId,
    required this.countryName,
    required this.nationality,
    required this.phonecode,
    required this.currency,
    required this.currencyName,
    required this.currencySymbol,
    required this.iso3,
    required this.emoji,
    required this.emojiU,
    required this.latitude,
    required this.longitude,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryId: json['id'] ?? 0,
      countryName: json['name'] ?? "",
      nationality: json['nationality'] ?? "",
      phonecode: json['phonecode'] ?? 0,
      currency: json['currency'] ?? "",
      currencyName: json['currency_name'] ?? "",
      currencySymbol: json['currency_symbol'] ?? "",
      iso3: json['iso3'] ?? "",
      emoji: json['emoji'] ?? "",
      emojiU: json['emojiU'] ?? "",
      latitude: json['latitude'] ?? "",
      longitude: json['longitude'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': countryId,
      'name': countryName,
      'nationality': nationality,
      'phonecode': phonecode,
      'currency': currency,
      'currency_name': currencyName,
      'currency_symbol': currencySymbol,
      'iso3': iso3,
      'emoji': emoji,
      'emojiU': emojiU,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
