class ReviewModel {
  final String status;
  final String message;
  final double overallRating;
  final List<Review> reviews;

  ReviewModel({
    required this.status,
    required this.message,
    required this.overallRating,
    required this.reviews,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      status: json['status'],
      message: json['message'],
      overallRating: (json['overall_rating'] ?? 0).toDouble(),
      reviews: (json['data'] as List<dynamic>)
          .map((e) => Review.fromJson(e))
          .toList(),
    );
  }
}

class Review {
  final int id;
  final String user;
  final String userName;
  final String? userProfileImage;
  final String propertyName;
  final String rating;
  final String comment;
  final String createdAt;

  Review({
    required this.id,
    required this.user,
    required this.userName,
    this.userProfileImage,
    required this.propertyName,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      user: json['user'],
      userName: json['user_name'],
      userProfileImage: json['user_profile_image'],
      propertyName: json['property_name'],
      rating: json['rating'].toString(),
      comment: json['comment'] ?? '',
      createdAt: json['created_at'],
    );
  }
}
