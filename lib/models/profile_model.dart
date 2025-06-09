class ProfileModel {
  String? error;
  PersonalInfoData? data;

  ProfileModel({this.data});

  ProfileModel.withError(String errorMessage) {
    error = errorMessage;
  }

  ProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = PersonalInfoData.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
    };
  }
}

class PersonalInfoData {
  final int id;
  final int userId;
  final String nationality;
  final String name;
  final String email;
  final String role;
  final String profilePic;
  final String fullName;
  final String dob;
  final String gender;
  final String occupation;

  PersonalInfoData({
    required this.id,
    required this.userId,
    required this.nationality,
    required this.name,
    required this.email,
    required this.role,
    required this.profilePic,
    required this.fullName,
    required this.dob,
    required this.gender,
    required this.occupation,
  });

  factory PersonalInfoData.fromJson(Map<String, dynamic> json) {
    return PersonalInfoData(
      id: json['id'] ?? 0,
      userId: json['user'] ?? 0,
      nationality: json['nationality'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      role: json['role'] ?? "",
      profilePic: json['profile_image'] ?? "",
      fullName: json['full_name'] ?? "",
      dob: json['dob'] ?? "",
      gender: json['gender'] ?? "",
      occupation: json['occupation'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': userId,
      'nationality': nationality,
      'name': name,
      'email': email,
      'role': role,
      'profile_image': profilePic,
      'full_name': fullName,
      'dob': dob,
      'gender': gender,
      'occupation': occupation,
    };
  }
}
