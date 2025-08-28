class DealModel {
  final int id;
  final String title;
  final String startDate;
  final String endDate;
  final String bannerImage;

  DealModel({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.bannerImage,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
      id: json['id'],
      title: json['title'] ?? "",
      startDate: json['start_date'] ?? "",
      endDate: json['end_date'] ?? "",
      bannerImage: json['banner_image'] ?? "",
    );
  }
}
