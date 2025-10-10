// import 'package:flutter/material.dart';
// import 'package:realestate_fe/core/utils/app_assets.dart';
// import 'package:realestate_fe/core/utils/app_colors.dart';

// class EmptySavedScreen extends StatefulWidget {
//   const EmptySavedScreen({super.key});

//   @override
//   State<EmptySavedScreen> createState() => _EmptySavedScreenState();
// }

// class _EmptySavedScreenState extends State<EmptySavedScreen> {
//   final List<String> saved = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.lightGray,
//       appBar: AppBar(
//         title: const Text(
//           "Saved",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: AppColors.black,
//           ),
//         ),
//         centerTitle: true,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Image.asset(AppAssets.arrowbackIcon),
//           ),
//         ),
//         backgroundColor: AppColors.white,
//       ),
//       body: saved.isEmpty ? _buildEmptySavedState() : _buildNotificationList(),
//     );
//   }

//   // Empty notification UI
//   Widget _buildEmptySavedState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             AppAssets.nosaved,
//             height: 200,
//             width: 200,
//             fit: BoxFit.cover,
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             "Nothing saved yet",
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.mediumGray),
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             "Start saving your favorites! ",
//             style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.mediumGray),
//           ),
//           const SizedBox(height: 5),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               elevation: 0,
//               backgroundColor: Colors.teal,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             child: const Text(
//               "Explore",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Notification list UI
//   Widget _buildNotificationList() {
//     return ListView.builder(
//       itemCount: saved.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: const Icon(Icons.notifications),
//           title: Text(saved[index]),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:realestate_fe/features/saved/presentation/bloc/saved_event.dart';
import 'package:realestate_fe/features/saved/presentation/bloc/saved_state.dart';
import 'package:realestate_fe/services/saved/saved_repository.dart';

class EmptySavedScreen extends StatelessWidget {
  const EmptySavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => SavedRepository(),
      child: BlocProvider(
        create: (context) =>
            SavedBloc(context.read<SavedRepository>())..add(GetSavedProperties()),
        child: Scaffold(
          backgroundColor: AppColors.lightGray,
          appBar: AppBar(
            title: const Text(
              "Saved",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(AppAssets.arrowbackIcon),
              ),
            ),
            backgroundColor: AppColors.white,
          ),
          body: BlocBuilder<SavedBloc, SavedState>(
            builder: (context, state) {
              if (state is SavedLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SavedLoaded) {
                if (state.savedList.isEmpty) {
                  return _buildEmptySavedState();
                }
                return ListView.builder(
                  itemCount: state.savedList.length,
                  itemBuilder: (context, index) {
                    final property = state.savedList[index];
                    return ListTile(
                      leading: const Icon(Icons.home),
                      title: Text(property.name ?? "No name"),
                      subtitle: Text("Price: ${property.price ?? '-'}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context
                              .read<SavedBloc>()
                              .add(RemoveSavedProperty(property.id!));
                        },
                      ),
                    );
                  },
                );
              } else if (state is SavedError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmptySavedState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.nosaved, height: 200, width: 200),
          const SizedBox(height: 20),
          const Text(
            "Nothing saved yet",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.mediumGray),
          ),
          const SizedBox(height: 5),
          const Text(
            "Start saving your favorites!",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.mediumGray),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Explore",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
