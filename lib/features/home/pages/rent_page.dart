import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/home/widgets/foryou/bottom_image.dart';
import 'package:realestate_fe/features/home/widgets/rent/rent_banner.dart';
import 'package:realestate_fe/features/home/widgets/rent/trending_properties.dart';
import 'package:realestate_fe/features/home/widgets/viewmore_common.dart';

class RentPage extends StatelessWidget {
  const RentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          RentBanner(),
          SizedBox(height: 10),
          TrendingProperties(),
          BottomImage(
            isForyou: false,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 450,
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Properties Near You",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => ViewmoreCommon(
                        index: index,
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: 5,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
