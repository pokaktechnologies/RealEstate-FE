import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class Mybookinginfo extends StatelessWidget {
  final String title;
  final Map<String, String> details;
  final Widget? bottomButtons;

  const Mybookinginfo({
    super.key,
    required this.title,
    required this.details,
    this.bottomButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 18)),
            const SizedBox(height: 10),
            Column(
              children: details.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mediumGray),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(entry.value,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black)),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            if (bottomButtons != null) ...[
              if (bottomButtons is! Center) ...[
                const SizedBox(height: 12),
                const Divider(height: 1, color: Colors.grey),
              ],
              const SizedBox(height: 15),
              bottomButtons!,
            ],
          ],
        ),
      ),
    );
  }
}
