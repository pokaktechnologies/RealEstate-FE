class PersonalInfoModel {
  String? error;
  PersonalInfoData? data;
  PersonalInfoModel({this.error, this.data});

  PersonalInfoModel.withError(String errorMessage) {
    error = errorMessage;
  }
  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return PersonalInfoModel(
      data:
          json['data'] != null ? PersonalInfoData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
    };
  }
}

class PersonalInfoData {
  final int personalid;
  final String nationality;
  final String name;
  final String email;
  final String role;
  final String profileImage;
  final String fullName;
  final String dob;
  final String gender;
  final String occupation;
  final int user;

  PersonalInfoData({
    required this.personalid,
    required this.nationality,
    required this.name,
    required this.email,
    required this.role,
    required this.profileImage,
    required this.fullName,
    required this.dob,
    required this.gender,
    required this.occupation,
    required this.user,
  });

  factory PersonalInfoData.fromJson(Map<String, dynamic> json) {
    return PersonalInfoData(
      personalid: json['id'] ?? 0,
      nationality: json['nationality'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      profileImage: json['profile_image'] ?? '',
      fullName: json['full_name'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      occupation: json['occupation'] ?? '',
      user: json['user'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': personalid,
      'nationality': nationality,
      'name': name,
      'email': email,
      'role': role,
      'profile_image': profileImage,
      'full_name': fullName,
      'dob': dob,
      'gender': gender,
      'occupation': occupation,
      'user': user,
    };
  }
}
