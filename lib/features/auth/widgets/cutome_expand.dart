import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget content;

  const ExpandableSection({required this.title, required this.content});

  @override
  State<ExpandableSection> createState() => ExpandableSectionState();
}

class ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.mediumGray.withOpacity(0.4),
            width: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              trailing: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: AppColors.tealBlue,
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            if (_isExpanded)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: widget.content,
              ),
          ],
        ),
      ),
    );
  }
}
