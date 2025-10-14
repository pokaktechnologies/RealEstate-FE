import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_bloc.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_event.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_state.dart';
import 'package:realestate_fe/models/dealsmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SponsoredScreen extends StatefulWidget {
  const SponsoredScreen({super.key});

  @override
  State<SponsoredScreen> createState() => _SponsoredScreenState();
}

class _SponsoredScreenState extends State<SponsoredScreen> {
  int adsCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<DealBloc>().add(FetchDeals());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealBloc, DealState>(
      builder: (context, state) {
        if (state is DealLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DealLoaded) {
          final List<DealModel> deals = state.deals;

          if (deals.isEmpty) {
            return const Center(child: Text("No sponsored deals available"));
          }

          return Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CarouselSlider.builder(
                  itemCount: deals.length,
                  itemBuilder: (context, index, realIdx) {
                    final deal = deals[index];
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
                        child: Image.network(
                          deal.bannerImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image, size: 40),
                          ),
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
                count: deals.length,
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
        } else if (state is DealError) {
          return Center(child: Text("Error: ${state.message}"));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
