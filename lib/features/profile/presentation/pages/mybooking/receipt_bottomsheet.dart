import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class DownloadReceiptSheet extends StatelessWidget {
  const DownloadReceiptSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.image,
                color: AppColors.white,
                size: 28,
              ),
              label: Text(
                "Download as Image",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.tealBlue,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Divider(color: AppColors.mediumGray)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Or",
                    style: TextStyle(
                        color: AppColors.mediumGray,
                        fontWeight: FontWeight.w600)),
              ),
              Expanded(child: Divider(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.picture_as_pdf,
                color: AppColors.tealBlue,
                size: 28,
              ),
              label: Text(
                "Download as Pdf",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 168, 167, 167),
                foregroundColor: AppColors.black,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
