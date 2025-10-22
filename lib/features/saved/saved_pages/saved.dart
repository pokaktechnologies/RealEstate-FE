import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/core/utils/navigations.dart';
import 'package:realestate_fe/features/auth_user/widgets/custom_button.dart';
import 'package:realestate_fe/features/home_bottom_bar/bottom_bar.dart';
import 'package:realestate_fe/features/property_details/property_details_pages/property_details.dart';
import 'package:realestate_fe/features/saved/saved_bloc/saved_bloc.dart';
import 'package:realestate_fe/features/saved/saved_bloc/saved_event.dart';
import 'package:realestate_fe/features/saved/saved_bloc/saved_state.dart';
import 'package:realestate_fe/services/saved/saved_repository.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SavedBloc(SavedRepository())..add(FetchSavedProperties()),
      child: Scaffold(
        backgroundColor: AppColors.lightGray,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: const Text(
            'Saved',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocConsumer<SavedBloc, SavedState>(
          listener: (context, state) {
            if (state is SavedError) {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text(state.message)),
              // );
            }
            if (state is SavedDeleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Deleted Successfully',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                  backgroundColor: AppColors.red,
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is SavedLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SavedEmpty) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.nosaved,
                  ),
                  Text(
                    "Nothing saved yet",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.grey),
                  ),
                  Text(
                    "Start saving your favorites!",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 120,
                    child: CustomButton(
                      buttonText: const Text(
                        "Explore",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                      onPressed: () {
                        pushAndRemoveUntilFun(context, const BottomBar());
                      },
                    ),
                  )
                ],
              ));
            } else if (state is SavedError) {
              // return Center(
              //   child: Text(state.message),
              // );
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.nosaved,
                  ),
                  Text(
                    "Nothing saved yet",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.grey),
                  ),
                  Text(
                    "Start saving your favorites!",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 120,
                    child: CustomButton(
                      buttonText: const Text(
                        "Explore",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                      onPressed: () {
                        pushAndRemoveUntilFun(context, const BottomBar());
                      },
                    ),
                  )
                ],
              ));
            } else if (state is SavedLoaded) {
              final properties = state.properties;

              return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  final property = properties[index];

                  return Card(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () => pushNavigation(context,
                          PropertyDetailsScreen(propertyId: property.savedId)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                property.image ?? '',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.image_not_supported),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    property.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${property.city}, ${property.state}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '₹${property.price}/${property.priceType}',
                                    style: const TextStyle(
                                      color: AppColors.tealBlue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<SavedBloc>()
                                    .add(RemoveSavedProperty(property.savedId));
                              },
                              child: const Icon(
                                Icons.delete_outline,
                                color: AppColors.red,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
