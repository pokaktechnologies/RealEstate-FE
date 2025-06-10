import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth/widgets/cutome_expand.dart';
import 'package:realestate_fe/models/profile_model.dart';

class EditProfileScreen extends StatefulWidget {
  final PersonalInfoData user;
  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  late TextEditingController emailIdTextController;
  late TextEditingController primaryPhoneCodeController;
  late TextEditingController primaryPhoneNumberController;
  late TextEditingController secondaryPhoneCodeController;
  late TextEditingController secondaryPhoneNumberController;
  late TextEditingController addressController;
  late TextEditingController stateController;
  late TextEditingController countryController;

  @override
  void initState() {
    super.initState();
    emailIdTextController = TextEditingController(text: widget.user.email);
    primaryPhoneCodeController = TextEditingController();
    primaryPhoneNumberController = TextEditingController();
    secondaryPhoneCodeController = TextEditingController();
    secondaryPhoneNumberController = TextEditingController();
    addressController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
  }

  @override
  void dispose() {
    emailIdTextController.dispose();
    primaryPhoneCodeController.dispose();
    primaryPhoneNumberController.dispose();
    secondaryPhoneCodeController.dispose();
    secondaryPhoneNumberController.dispose();
    addressController.dispose();
    stateController.dispose();
    countryController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.arrowbackIcon),
        ),
        backgroundColor: AppColors.white,
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: _imageFile != null
                                ? FileImage(_imageFile!) as ImageProvider
                                : AssetImage(AppAssets.userProfile),
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AppAssets.camerplusIcon,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.user.fullName,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          Text("+91 856321478",
                              style: TextStyle(
                                  color: AppColors.mediumGray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.user.email,
                                style: TextStyle(
                                  color: AppColors.mediumGray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => EditProfileScreen(),
                                  //   ),
                                  // );
                                },
                                child: Image.asset(
                                  AppAssets.editIcon,
                                  height: 20,
                                  width: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // ----- personal info ---------------------------------------------------

              // ExpandableSection(
              //   title: "Personal Info",
              //   content: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       buildLabel("Name", true),
              //       buildTextField("Enter Name"),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 buildLabel("DOB", true),
              //                 buildTextField("DD/MM/YYYY"),
              //               ],
              //             ),
              //           ),
              //           SizedBox(width: 15),
              //           Expanded(
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 buildLabel("Gender", true),
              //                 buildDropdown(["Male", "Female", "Other"]),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 buildLabel("Occupation", true),
              //                 buildTextField("Enter Occupation"),
              //               ],
              //             ),
              //           ),
              //           SizedBox(width: 15),
              //           Expanded(
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 buildLabel("Nationality", true),
              //                 buildDropdown(
              //                     ["India", "United States ", "Canada"]),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: buildLabel("Government ID", true),
              //           ),
              //           SizedBox(width: 15),
              //           Expanded(
              //             child: buildDropdown(
              //                 ["Passport", "Pan Card ", "Aadhaar"]),
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       buildTextField("Upload Document", showCloseIcon: true),
              //       SizedBox(height: 10),
              //       Text(
              //         "File should be in jpg/pdf format, Max 3mb",
              //         style:
              //             TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              //       ),
              //       SizedBox(height: 20),
              //       Center(
              //         child: InkWell(
              //           onTap: () {},
              //           child: Text(
              //             "Save",
              //             style: TextStyle(
              //               color: AppColors.tealBlue,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600,
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(height: 20),
              //     ],
              //   ),
              // ),

              // -------------------- personal info end --------------------------------

              // Contact Details Section
              ExpandableSection(
                title: "Contact Details",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabel("Email", true),
                    buildTextField("Enter your email", emailIdTextController),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildLabel("Phone", true),
                              buildTextField("+91", primaryPhoneCodeController),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildLabel("", false),
                              buildTextField("Enter your number",
                                  primaryPhoneNumberController),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildLabel("Alternate", false),
                              buildTextField(
                                  "+91", secondaryPhoneNumberController),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildLabel("", false),
                              buildTextField("Enter your number",
                                  secondaryPhoneNumberController),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    buildLabel("Address", true),
                    buildTextField("Enter your address", addressController),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildLabel("State", true),
                              buildTextField("Select", stateController)
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildLabel("Country", true),
                              buildTextField("Select", countryController)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: AppColors.tealBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              ExpandableSection(
                title: "Payment Methods",
                content: Column(
                  children: [
                    buildPaymentOption(
                        AppAssets.creditCardIcon, "Add Credit/Debit Card"),
                    buildPaymentOption(AppAssets.paypalIcon, "Add UPI"),
                    buildPaymentOption(
                        AppAssets.bankTransferIcon, "Add Bank Account"),
                    SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: AppColors.tealBlue, // Teal text color
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              ExpandableSection(
                title: "Peferences",
                content: Column(
                  children: [],
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
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
                  onPressed: () {
                    // Add logic to clear the field
                  },
                )
              : null, // Show icon only if `showCloseIcon` is true
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

  Widget buildDropdown(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField(
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
            filled: true,
            fillColor: AppColors.lightGray),
        icon: Icon(Icons.keyboard_arrow_down, color: AppColors.tealBlue),
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {},
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
}
