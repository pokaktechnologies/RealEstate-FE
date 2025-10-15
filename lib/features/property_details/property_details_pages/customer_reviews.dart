import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/models/reviews_model.dart';

class CustomerReviewScreen extends StatelessWidget {
  final List<Review> reviews;

  const CustomerReviewScreen({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    double averageRating = _calculateAverageRating(reviews);

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: Text(
          "Reviews",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.arrowbackIcon),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            averageRating.toStringAsFixed(1),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              if (index < averageRating.floor()) {
                                return const Icon(Icons.star,
                                    color: Colors.orange, size: 30);
                              } else if (index < averageRating) {
                                return const Icon(Icons.star_half,
                                    color: Colors.orange, size: 30);
                              } else {
                                return const Icon(Icons.star_border,
                                    color: Colors.orange, size: 30);
                              }
                            }),
                          ),
                          Text(
                            'Based on ${reviews.length} reviews',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mediumGray),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildRatingBar('5 Star',
                        _calculateStarPercentage(reviews, 5), Colors.green),
                    _buildRatingBar('4 Star',
                        _calculateStarPercentage(reviews, 4), Colors.yellow),
                    _buildRatingBar(
                        '3 Star',
                        _calculateStarPercentage(reviews, 3),
                        Colors.orangeAccent),
                    _buildRatingBar(
                        '2 Star',
                        _calculateStarPercentage(reviews, 2),
                        Colors.deepOrange),
                    _buildRatingBar('1 Star',
                        _calculateStarPercentage(reviews, 1), Colors.red),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            // List of reviews
            Expanded(
              child: Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: reviews.length,
                          separatorBuilder: (context, index) => Divider(
                            color: AppColors.grey,
                            thickness: 1,
                          ),
                          itemBuilder: (context, index) {
                            return _buildReviewCard(reviews[index]);
                          },
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Write Review',
                          hintStyle: TextStyle(color: AppColors.grey),
                          filled: true,
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tealBlue, width: 2),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: AppColors.tealBlue,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Rating bar row
  Widget _buildRatingBar(String label, double value, Color barColor) {
    return Row(
      children: [
        SizedBox(
            width: 60,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey.shade300,
            color: barColor,
          ),
        ),
      ],
    );
  }

  // Single review card
  Widget _buildReviewCard(Review review) {
    double rating = double.tryParse(review.rating ?? '0') ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: (review.userProfileImage != null &&
                    review.userProfileImage!.startsWith('http'))
                ? NetworkImage(review.userProfileImage!)
                : null,
            child: (review.userProfileImage == null ||
                    !review.userProfileImage!.startsWith('http'))
                ? const Icon(Icons.person, size: 20)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < rating.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.orange,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  review.createdAt,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  review.comment ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Calculate average rating
  double _calculateAverageRating(List<Review> reviews) {
    if (reviews.isEmpty) return 0;
    double total = 0;
    for (var r in reviews) {
      total += double.tryParse(r.rating) ?? 0;
    }
    return total / reviews.length;
  }

  // Calculate percentage for each star for progress bar
  double _calculateStarPercentage(List<Review> reviews, int star) {
    if (reviews.isEmpty) return 0;
    int count = reviews
        .where((r) => (double.tryParse(r.rating) ?? 0).floor() == star)
        .length;
    return count / reviews.length;
  }
}
