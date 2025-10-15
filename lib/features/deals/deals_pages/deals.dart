import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_bloc.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_event.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_state.dart';
import 'package:realestate_fe/models/dealsmodel.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({super.key});

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DealBloc>().add(FetchDeals());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: Text(
          'Deals',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<DealBloc, DealState>(
          builder: (context, state) {
            if (state is DealLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DealLoaded) {
              final List<DealModel> deals = state.deals;

              if (deals.isEmpty) {
                return const Center(child: Text("No deals available"));
              }

              return ListView.separated(
                itemCount: deals.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final deal = deals[index];
                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 600 + (index * 120)),
                    curve: Curves.easeOutBack,
                    builder: (context, value, child) {
                      final opacity = value.clamp(0.0, 1.0);
                      return Opacity(
                        opacity: opacity,
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * 50),
                          child: Transform.scale(
                            scale: 0.9 + (value * 0.1),
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.network(
                            deal.bannerImage,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 180,
                              color: Colors.grey[300],
                              child: const Icon(Icons.broken_image, size: 40),
                            ),
                          ),
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.transparent
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              deal.title,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is DealError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
