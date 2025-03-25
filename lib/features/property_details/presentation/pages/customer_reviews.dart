import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class CustomerReviewScreen extends StatelessWidget {
  const CustomerReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: Text(
          "Review",
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
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            '4.8',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return Icon(
                                index < 4 ? Icons.star : Icons.star_half,
                                color: Colors.orange,
                                size: 30,
                              );
                            }),
                          ),
                          Text(
                            'Based on 20 reviews',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mediumGray),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildRatingBar('5 Star', 0.8, Colors.green),
                    _buildRatingBar('4 Star', 0.6, Colors.yellow),
                    _buildRatingBar('3 Star', 0.4, Colors.orangeAccent),
                    _buildRatingBar('2 Star', 0.2, Colors.deepOrange),
                    _buildRatingBar('1 Star', 0.1, Colors.red),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: 2,
                          separatorBuilder: (context, index) => Divider(
                            color: AppColors.grey,
                            thickness: 1,
                          ),
                          itemBuilder: (context, index) {
                            return _buildReviewCard();
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

  Widget _buildRatingBar(String label, double value, Color barColor) {
    return Row(
      children: [
        SizedBox(
            width: 60,
            child: Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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

  Widget _buildReviewCard() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(AppAssets.evemariarofile),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Eva Maria',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: List.generate(
                          5,
                          (index) =>
                              Icon(Icons.star, color: Colors.orange, size: 16)),
                    ),
                  ],
                ),
                Text('Nov 2024', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Text(
                  'Your communication made the booking process easy. Would definitely recommend!',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
