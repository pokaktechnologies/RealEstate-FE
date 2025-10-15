import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/property_details/review_bloc/reviews_bloc.dart';
import 'package:realestate_fe/features/property_details/review_bloc/reviews_event.dart';
import 'package:realestate_fe/features/property_details/review_bloc/reviews_state.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/property_details/property_details_pages/customer_reviews.dart';
import 'package:realestate_fe/services/reviews/reviews_repository.dart';

class ReviewsScreen extends StatelessWidget {
  final int propertyId;
  const ReviewsScreen({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ReviewsBloc(ReviewRepository())..add(FetchReviews(propertyId)),
      child: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          if (state is ReviewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReviewsLoaded) {
            final reviews = state.reviewResponse.reviews;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerReviewScreen(
                                    reviews: reviews,
                                  )),
                        );
                      },
                      child: Text(
                        'View all(${reviews.length})',
                        style: TextStyle(
                          color: AppColors.mediumGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        elevation: 8,
                        child: Container(
                          color: AppColors.white,
                          width: 200,
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '"${review.comment}"',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: (review.userProfileImage !=
                                                null &&
                                            review.userProfileImage!.isNotEmpty)
                                        ? NetworkImage(review.userProfileImage!)
                                        : null,
                                    child: (review.userProfileImage == null ||
                                            review.userProfileImage!.isEmpty)
                                        ? const Icon(Icons.person, size: 20)
                                        : null,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review.userName,
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          review.createdAt,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: AppColors.mediumGray,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.star,
                                    color: AppColors.ratingColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    review.rating,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Write Review',
                    hintStyle: TextStyle(color: AppColors.grey),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.tealBlue, width: 2),
                      borderRadius: BorderRadius.circular(10),
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
                  onTap: () {
                    /// Navigate to Write Review Screen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => WriteReviewScreen(),
                    //   ),
                    // );
                  },
                ),
                const SizedBox(height: 40),
              ],
            );
          } else if (state is ReviewsError) {
            return Text("Error: ${state.message}");
          }
          return const SizedBox();
        },
      ),
    );
  }
}
