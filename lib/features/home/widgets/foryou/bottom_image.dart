import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/deals/bloc/deals_bloc.dart';
import 'package:realestate_fe/features/deals/bloc/deals_event.dart';
import 'package:realestate_fe/features/deals/bloc/deals_state.dart';
import 'package:realestate_fe/models/dealsmodel.dart';

class BottomImage extends StatefulWidget {
  final bool isForyou;
  const BottomImage({super.key, required this.isForyou});

  @override
  State<BottomImage> createState() => _BottomImageState();
}

class _BottomImageState extends State<BottomImage> {
  @override
  void initState() {
    super.initState();
    context.read<DealBloc>().add(FetchDeals());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightMint,
     
      padding: const EdgeInsets.all(18),
      child: BlocBuilder<DealBloc, DealState>(
        builder: (context, state) {
          if (state is DealLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DealLoaded) {
            final List<DealModel> deals = state.deals;

            if (deals.isEmpty) {
              return const Center(child: Text("No deals available"));
            }
            final deal = deals.first;
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                deal.bannerImage,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 40),
                ),
              ),
            );
          } else if (state is DealError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
