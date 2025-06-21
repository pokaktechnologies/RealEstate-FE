class ContactModel {
  String? error;
  ContactData? data;
  ContactModel({this.data, this.error});
  ContactModel.withError(String errorMessage) {
    error = errorMessage;
    data = null;
  }
  ContactModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? ContactData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
    };
  }
}

class ContactData {
  final int primaryPhoneCode;
  final String primaryPhone;
  final int secondaryPhoneCode;
  final String secondaryPhone;
  final String address;
  final int state;
  final int country;

  ContactData({
    required this.primaryPhoneCode,
    required this.primaryPhone,
    required this.secondaryPhoneCode,
    required this.secondaryPhone,
    required this.address,
    required this.state,
    required this.country,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) {
    return ContactData(
      primaryPhoneCode:
          int.tryParse(json['primary_phone_code'].toString()) ?? 0,
      primaryPhone: json['primary_phone'] ?? '',
      secondaryPhoneCode:
          int.tryParse(json['secondary_phone_code'].toString()) ?? 0,
      secondaryPhone: json['secondary_phone'] ?? '',
      address: json['address'] ?? '',
      state: int.tryParse(json['state'].toString()) ?? 0,
      country: int.tryParse(json['country'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primary_phone_code': primaryPhoneCode,
      'primary_phone': primaryPhone,
      'secondary_phone_code': secondaryPhoneCode,
      'secondary_phone': secondaryPhone,
      'address': address,
      'state': state,
      'country': country,
    };
  }
}
