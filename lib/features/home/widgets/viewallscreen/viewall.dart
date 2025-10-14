// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:realestate_fe/core/utils/app_colors.dart';
// import 'package:realestate_fe/features/home/home_bloc/properties_bloc.dart';
// import 'package:realestate_fe/features/home/home_bloc/properties_state.dart';
// import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';

// class PGViewAllScreen extends StatelessWidget {
//   const PGViewAllScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         title: const Text(
//           'Paying Guest Stays',
//           style: TextStyle(
//             color: AppColors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         iconTheme: const IconThemeData(color: AppColors.black),
//       ),
//       body: BlocBuilder<PropertiesBloc, PropertiesState>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state.idealPGList.isEmpty) {
//             return const Center(child: Text("No Paying Guest Properties found"));
//           }

//           final properties = state.idealPGList;

//           return Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: GridView.builder(
//               itemCount: properties.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // ✅ 2 items per row
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.8,
//               ),
//               itemBuilder: (context, index) {
//                 final property = properties[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PropertyDetailsScreen(
//                           propertyId: property.id,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       side: const BorderSide(
//                         color: AppColors.blackTranslucent,
//                         width: 0.5,
//                       ),
//                     ),
//                     elevation: 3,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(12),
//                             topRight: Radius.circular(12),
//                           ),
//                           child: Image.network(
//                             property.images.isNotEmpty
//                                 ? property.images[0].imageName
//                                 : 'assets/no-img.jpg',
//                             height: 100,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "₹${property.price}",
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               Text(
//                                 property.name,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Text(
//                                 "${property.city}, ${property.state}",
//                                 style: const TextStyle(
//                                   fontSize: 11,
//                                   color: AppColors.lightBlack,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:realestate_fe/core/utils/app_colors.dart';
// import 'package:realestate_fe/features/home/home_bloc/properties_bloc.dart';
// import 'package:realestate_fe/features/home/home_bloc/properties_state.dart';
// import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';

// class ViewAllGridScreen extends StatelessWidget {
//   final String title;
//   final String listType;

//   const ViewAllGridScreen({
//     super.key,
//     required this.title,
//     required this.listType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: AppColors.black),
//         title: Text(
//           title,
//           style: const TextStyle(
//             color: AppColors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: BlocBuilder<PropertiesBloc, PropertiesState>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           // Select list dynamically
//           final properties = listType == 'pg'
//               ? state.idealPGList
//               : listType == 'rent'
//                   ? state.rentpropertiesList
//                   : state.trendingProperties;

//           if (properties.isEmpty) {
//             return Center(child: Text("No $title found"));
//           }

//           return Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: GridView.builder(
//               itemCount: properties.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.8,
//               ),
//               itemBuilder: (context, index) {
//                 final property = properties[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => PropertyDetailsScreen(
//                           propertyId: property.id,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     elevation: 3,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       side: const BorderSide(
//                         color: AppColors.blackTranslucent,
//                         width: 0.5,
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(12),
//                             topRight: Radius.circular(12),
//                           ),
//                           child: Image.network(
//                             property.images.isNotEmpty
//                                 ? property.images[0].imageName
//                                 : 'assets/no-img.jpg',
//                             height: 100,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "₹${property.price}",
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               Text(
//                                 property.name,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Text(
//                                 "${property.city}, ${property.state}",
//                                 style: const TextStyle(
//                                   fontSize: 11,
//                                   color: AppColors.lightBlack,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/property_details/presentation/pages/property_details.dart';
import 'package:realestate_fe/models/rent_properties_model.dart';

class ViewAllGridScreen extends StatelessWidget {
  final String title;
  final List<RentPropertiesModel> properties;

  const ViewAllGridScreen({
    super.key,
    required this.title,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.black),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: properties.isEmpty
          ? Center(
              child: Text("No $title found"),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: properties.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final property = properties[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PropertyDetailsScreen(
                            propertyId: property.id,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: AppColors.blackTranslucent,
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.network(
                              property.images.isNotEmpty
                                  ? property.images[0].imageName
                                  : 'assets/no-img.jpg',
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹${property.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  property.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${property.city}, ${property.state}",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.lightBlack,
                                  ),
                                ),
                              ],
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
