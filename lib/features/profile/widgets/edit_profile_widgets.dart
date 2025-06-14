import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

Widget buildCustomDropdown({
  required String hint,
  required String? value,
  required List<String> items,
  required Function(String?) onChanged,
}) {
  return DropdownButtonFormField<String>(
    value: value != '' ? value : null,
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: AppColors.lightGray,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.tealBlue, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.tealBlue, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.tealBlue, width: 1),
      ),
    ),
    icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.tealBlue),
    dropdownColor: Colors.white,
    style: TextStyle(color: Colors.black87, fontSize: 14),
    items: items.map((item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList(),
    onChanged: onChanged,
  );
}

Widget buildTextField(String hint, controller, {bool showCloseIcon = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.tealBlue, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.tealBlue, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.tealBlue, width: 1),
        ),
        hintText: hint,
        filled: true,
        fillColor: AppColors.lightGray,
        suffixIcon: showCloseIcon
            ? IconButton(
                icon: Icon(Icons.close, color: AppColors.tealBlue),
                onPressed: () {},
              )
            : null,
      ),
    ),
  );
}

Widget buildLabel(String text, bool isMandatory) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
        if (isMandatory)
          TextSpan(
            text: ' *',
            style: TextStyle(
              color: AppColors.tealBlue,
              fontSize: 16,
            ),
          ),
      ],
    ),
  );
}

Widget buildPaymentOption(String imagePath, String text) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.red.withOpacity(0.1)),
    ),
    margin: EdgeInsets.symmetric(vertical: 6),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      leading: Image.asset(
        imagePath,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      onTap: () {},
    ),
  );
}

void showCustomBottomSheet(
  BuildContext context,
  String title,
  List<String> items,
  Function(String selected) onItemSelected,
) {
  TextEditingController searchController = TextEditingController();
  List<String> filteredItems = List.from(items);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            border: Border.all(color: AppColors.tealBlue, width: 3),
          ),
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.tealBlue),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 12),
              TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    filteredItems = items
                        .where((item) =>
                            item.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                cursorColor: AppColors.tealBlue,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade600),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.tealBlue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Flexible(
                child: filteredItems.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("No items found",
                            style: TextStyle(color: AppColors.black)),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            filteredItems[index],
                            style: TextStyle(color: AppColors.black),
                          ),
                          onTap: () {
                            onItemSelected(filteredItems[index]);
                            Navigator.pop(context);
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
