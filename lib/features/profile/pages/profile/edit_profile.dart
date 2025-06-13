import 'dart:io';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth/widgets/cutome_expand.dart';
import 'package:realestate_fe/features/profile/blocs/country/country_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/country/country_event.dart';
import 'package:realestate_fe/features/profile/blocs/country/country_state.dart';
import 'package:realestate_fe/features/profile/blocs/state/state_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/state/state_event.dart';
import 'package:realestate_fe/features/profile/blocs/state/state_state.dart';
import 'package:realestate_fe/features/profile/widgets/animated_error.dart';
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

  // state and country dummy
  List<String> stateList = ['Kerala', 'Tamil Nadu', 'Karnataka'];

  String selectedState = '';

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
    context.read<CountryBloc>().add(GetCountryList());
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BlocBuilder<CountryBloc, CountryState>(
                            builder: (context, state) {
                              List<String> countryList = [];

                              if (state is CountryLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              if (state is CountryLoaded) {
                                countryList = state.countryModel.data
                                        ?.map((e) => e.countryName)
                                        .toList() ??
                                    [];

                                final selected = state.countryModel.data
                                    ?.firstWhereOrNull((e) =>
                                        e.countryId == state.selectedCountryId);

                                if (selected != null) {
                                  countryController.text = selected.countryName;
                                }
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildLabel("Country", true),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      if (countryList.isNotEmpty &&
                                          state is CountryLoaded) {
                                        showCustomBottomSheet(
                                          context,
                                          "Select Country",
                                          countryList,
                                          (selectedName) {
                                            countryController.text =
                                                selectedName;

                                            final selected = state
                                                .countryModel.data
                                                ?.firstWhereOrNull((e) =>
                                                    e.countryName ==
                                                    selectedName);

                                            if (selected != null) {
                                              stateController.clear();
                                              context.read<CountryBloc>().add(
                                                  SelectCountry(
                                                      selected.countryId));
                                              context.read<StateBloc>().add(
                                                  GetStateList(
                                                      selected.countryId));
                                            }
                                          },
                                        );
                                      }
                                    },
                                    child: AbsorbPointer(
                                      child: buildTextField(
                                          "Select", countryController),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: BlocBuilder<CountryBloc, CountryState>(
                            builder: (context, countryState) {
                              final isCountrySelected =
                                  countryState is CountryLoaded &&
                                      countryState.selectedCountryId != null;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildLabel("State", true),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      if (!isCountrySelected) {
                                        showAnimatedError(context,
                                            "Please select a country first.");
                                        return;
                                      }

                                      final stateBloc =
                                          context.read<StateBloc>();
                                      final stateState = stateBloc.state;

                                      if (stateState is StateLoaded) {
                                        final stateList = stateState
                                                .stateModel.data
                                                ?.map((e) => e.stateName)
                                                .toList() ??
                                            [];

                                        if (stateList.isNotEmpty) {
                                          showCustomBottomSheet(
                                            context,
                                            "Select State",
                                            stateList,
                                            (selected) {
                                              selectedState = selected;
                                              stateController.text = selected;
                                            },
                                          );
                                        } else {
                                          showAnimatedError(context,
                                              "No states found for selected country.");
                                        }
                                      } else {
                                        showAnimatedError(context,
                                            "State list is not loaded yet.");
                                      }
                                    },
                                    child: AbsorbPointer(
                                      child: BlocBuilder<StateBloc, StateState>(
                                        builder: (context, stateState) {
                                          if (stateState is StateLoading) {
                                            return const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16),
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            );
                                          }

                                          return buildTextField(
                                              "Select", stateController);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
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
                              color: AppColors.tealBlue,
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
