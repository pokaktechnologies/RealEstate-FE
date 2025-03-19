import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final List<Map<String, String>> savedProperties = [
    {
      'image': 'assets/saved/savedone.png',
      'title': 'Orchad House',
      'location': 'Edapally, Kochi',
      'price': '₹7000/Month',
    },
    {
      'image': 'assets/saved/savedtwo.png',
      'title': 'The Hollies House',
      'location': 'Kaloor, Kochi',
      'price': '₹8000/Month',
    },
    {
      'image': 'assets/saved/savedthree.png',
      'title': 'Sea Breezes House',
      'location': 'Kaloor, Kochi',
      'price': '₹8000/Month',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Saved',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: savedProperties.length,
          itemBuilder: (context, index) {
            final property = savedProperties[index];
            return Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            property['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                property['title']!,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 4),
                              Text(
                                property['location']!,
                                style: TextStyle(
                                    color: AppColors.mediumGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 2),
                              Text(
                                property['price']!,
                                style: TextStyle(
                                    color: AppColors.tealBlue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
