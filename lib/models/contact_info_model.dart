class ContactInfoModel {
  String? error;
  ContactInfoData? data;
  ContactInfoModel({this.data, this.error});
  ContactInfoModel.withError(String errorMessage) {
    error = errorMessage;
    data = null;
  }

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      data:
          json['data'] != null ? ContactInfoData.fromJson(json['data']) : null,
    );
  }
}

class ContactInfoData {
  final int id;
  final String country;
  final String state;
  final String primaryPhoneCode;
  final String secondaryPhoneCode;
  final String email;
  final String primaryPhone;
  final String secondaryPhone;
  final String address;
  final int user;

  ContactInfoData({
    required this.id,
    required this.country,
    required this.state,
    required this.primaryPhoneCode,
    required this.secondaryPhoneCode,
    required this.email,
    required this.primaryPhone,
    required this.secondaryPhone,
    required this.address,
    required this.user,
  });

  factory ContactInfoData.fromJson(Map<String, dynamic> json) {
    return ContactInfoData(
      id: json['id'],
      country: json['country'],
      state: json['state'],
      primaryPhoneCode: json['primary_phone_code'],
      secondaryPhoneCode: json['secondary_phone_code'],
      email: json['email'],
      primaryPhone: json['primary_phone'],
      secondaryPhone: json['secondary_phone'],
      address: json['address'],
      user: json['user'],
    );
  }
}
