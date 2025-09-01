import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_bloc.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_state.dart';
import 'package:realestate_fe/features/home/widgets/foryou/bottom_image.dart';
import 'package:realestate_fe/features/home/widgets/paying_guest/paying_banner.dart';
import 'package:realestate_fe/features/home/widgets/paying_guest/top_pics.dart';
import 'package:realestate_fe/features/home/widgets/viewmore_common.dart';

class PayingGuest extends StatelessWidget {
  const PayingGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          PayingBanner(),
          SizedBox(height: 10),
          TopPics(),
          BottomImage(
            isForyou: false,
          ),
          Container(
            height: 450,
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Properties Near You",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: BlocBuilder<PropertiesBloc, PropertiesState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state.trendingProperties.isEmpty) {
                          return const Center(
                              child: Text("No Properties Near To You."));
                        }

                        return ListView.separated(
                          itemCount: state.trendingProperties.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final property = state.trendingProperties[index];
                            return ViewmoreCommon(property: property);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
