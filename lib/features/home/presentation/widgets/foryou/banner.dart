import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SponsoredScreen extends StatefulWidget {
  const SponsoredScreen({super.key});

  @override
  State<SponsoredScreen> createState() => _SponsoredScreenState();
}

class _SponsoredScreenState extends State<SponsoredScreen> {
  final List<String> bannerImg = [
    AppAssets.bannerImg,
    AppAssets.bannerImg,
    AppAssets.bannerImg,
  ];

  int adsCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: CarouselSlider.builder(
            itemCount: bannerImg.length,
            itemBuilder: (context, index, realIdx) {
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    bannerImg[index],
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.easeInOut,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  adsCurrentIndex = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedSmoothIndicator(
          activeIndex: adsCurrentIndex,
          count: bannerImg.length,
          effect: const ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            dotColor: AppColors.grey,
            activeDotColor: AppColors.aquaTeal,
            expansionFactor: 4,
          ),
        ),
      ],
    );
  }
}
