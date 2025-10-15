import 'dart:io';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/auth_user/widgets/cutome_expand.dart';
import 'package:realestate_fe/features/profile/profile_bloc/contact/contact_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/contact/contact_event.dart';
import 'package:realestate_fe/features/profile/profile_bloc/contact/contact_state.dart';
import 'package:realestate_fe/features/profile/profile_bloc/country/country_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/country/country_event.dart';
import 'package:realestate_fe/features/profile/profile_bloc/country/country_state.dart';
import 'package:realestate_fe/features/profile/profile_bloc/personal_info/personalinfo_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/state/state_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/state/state_event.dart';
import 'package:realestate_fe/features/profile/profile_bloc/state/state_state.dart';
import 'package:realestate_fe/features/profile/widgets/animated_error.dart';
import 'package:realestate_fe/features/profile/widgets/edit_profile_widgets.dart';
import 'package:realestate_fe/models/contact_model.dart';
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
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController genderController;
  late TextEditingController occupationController;
  late TextEditingController nationController;
  late TextEditingController documentController;

  String selectedState = '';
  int? selectedCountryId;
  int? selectedStateId;

  @override
  void initState() {
    super.initState();
    emailIdTextController = TextEditingController(text: widget.user.email);
    nameController = TextEditingController(text: widget.user.fullName);
    dobController = TextEditingController(text: widget.user.dob);
    genderController = TextEditingController(text: widget.user.gender);
    occupationController = TextEditingController(text: widget.user.occupation);
    nationController = TextEditingController(text: widget.user.nationality);
    documentController = TextEditingController(text: widget.user.profilePic);

    primaryPhoneCodeController = TextEditingController();
    primaryPhoneNumberController = TextEditingController();
    secondaryPhoneCodeController = TextEditingController();
    secondaryPhoneNumberController = TextEditingController();
    addressController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();

    context.read<CountryBloc>().add(GetCountryList());
    context.read<ContactBloc>().add(GetContactEvent());
    context.read<PersonalinfoBloc>().add(GetPersonalInfo());
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

    return MultiBlocListener(
      listeners: [
        BlocListener<ContactBloc, ContactState>(
          listener: (context, state) {
            if (state is ContactLoaded) {
              final contact = state.contact.data;
              if (contact != null) {
                setState(() {
                  primaryPhoneCodeController.text =
                      contact.primaryPhoneCode.toString();
                  primaryPhoneNumberController.text = contact.primaryPhone;
                  secondaryPhoneCodeController.text =
                      contact.secondaryPhoneCode.toString();
                  secondaryPhoneNumberController.text = contact.secondaryPhone;
                  addressController.text = contact.address;
                });
              }
            }
          },
        ),
        BlocListener<CountryBloc, CountryState>(
          listener: (context, state) {
            if (state is CountryLoaded) {
              final contactState = context.read<ContactBloc>().state;
              if (contactState is ContactLoaded) {
                final contact = contactState.contact.data;
                if (contact != null) {
                  final matchedCountry = state.countryModel.data
                      ?.firstWhereOrNull(
                          (e) => e.countryName == contact.country);
                  if (matchedCountry != null) {
                    setState(() {
                      selectedCountryId = matchedCountry.countryId;
                      countryController.text = matchedCountry.countryName;
                    });

                    context
                        .read<CountryBloc>()
                        .add(SelectCountry(matchedCountry.countryId));
                    context
                        .read<StateBloc>()
                        .add(GetStateList(matchedCountry.countryId));
                  }
                }
              }
            }
          },
        ),
        BlocListener<StateBloc, StateState>(
          listener: (context, state) {
            if (state is StateLoaded) {
              final contactState = context.read<ContactBloc>().state;
              if (contactState is ContactLoaded) {
                final contact = contactState.contact.data;
                if (contact != null) {
                  final matchedState = state.stateModel.data
                      ?.firstWhereOrNull((e) => e.stateName == contact.state);
                  if (matchedState != null) {
                    setState(() {
                      selectedStateId = matchedState.stateId;
                      stateController.text = matchedState.stateName;
                    });
                  }
                }
              }
            }
          },
        ),
      ],
      child: Scaffold(
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
                            if (primaryPhoneNumberController.text.isNotEmpty)
                              Text(
                                "${primaryPhoneCodeController.text} ${primaryPhoneNumberController.text}",
                                style: TextStyle(
                                  color: AppColors.mediumGray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                                  onTap: () {},
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
                BlocListener<PersonalinfoBloc, PersonalinfoState>(
                  listener: (context, state) {
                    if (state is PersonalLoaded) {
                      final user = state.personalInfoModel.data;
                      if (user != null) {
                        setState(() {
                          nameController.text = user.fullName;
                          dobController.text = user.dob;
                          genderController.text = user.gender;
                          occupationController.text = user.occupation;
                          nationController.text = user.nationality;
                          documentController.text = user.profileImage;
                          emailIdTextController.text = user.email;
                        });
                      }
                    } else if (state is PersonalUpdated) {
                      // after update, re-fetch latest data
                      context.read<PersonalinfoBloc>().add(GetPersonalInfo());

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Profile updated successfully!")),
                      );
                    } else if (state is PersonalError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${state.message}")),
                      );
                    }
                  },
                  child: ExpandableSection(
                    title: "Personal Info",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildLabel("Name", true),
                        buildTextField("Enter Name", nameController),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildLabel("DOB", true),
                                  buildTextField("DD/MM/YYYY", dobController),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildLabel("Gender", true),
                                  buildTextField("Select", genderController),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildLabel("Occupation", true),
                                  buildTextField(
                                      "Enter Occupation", occupationController),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildLabel("Nationality", true),
                                  buildTextField("Select", nationController),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        buildLabel("Government ID", true),
                        const SizedBox(height: 10),
                        buildTextField("Upload Document", documentController,
                            showCloseIcon: true),
                        const SizedBox(height: 10),
                        const Text(
                          "File should be in jpg/pdf format, Max 3mb",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: InkWell(
                            onTap: () {
                              final updatedData = {
                                "id": widget.user.id,
                                "full_name": nameController.text,
                                "dob": dobController.text,
                                "gender": genderController.text,
                                "occupation": occupationController.text,
                                // "nationality": nationController.text,
                                "profile_image": documentController.text,
                                "email": emailIdTextController.text,
                              };
                              context
                                  .read<PersonalinfoBloc>()
                                  .add(UpdatePersonalInfo(updatedData));
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: AppColors.tealBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
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
                                buildTextField(
                                    "+91", primaryPhoneCodeController),
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
                                    "+91", secondaryPhoneCodeController),
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
                          // Country
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
                                          e.countryId ==
                                          state.selectedCountryId);

                                  if (selected != null) {
                                    countryController.text =
                                        selected.countryName;
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

                                                setState(() {
                                                  selectedCountryId =
                                                      selected.countryId;
                                                  selectedStateId = null;
                                                });

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

                          // State
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
                                              (selectedName) {
                                                stateController.text =
                                                    selectedName;

                                                final selectedItem = stateState
                                                    .stateModel.data
                                                    ?.firstWhereOrNull((e) =>
                                                        e.stateName ==
                                                        selectedName);

                                                if (selectedItem != null) {
                                                  setState(() {
                                                    selectedStateId =
                                                        selectedItem.stateId;
                                                  });
                                                }
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
                                        child:
                                            BlocBuilder<StateBloc, StateState>(
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
                          onTap: () {
                            if (countryController.text.isEmpty ||
                                stateController.text.isEmpty) {
                              showAnimatedError(context,
                                  "Please select both country and state");
                              return;
                            }

                            try {
                              final contact = ContactData(
                                primaryPhoneCode: int.parse(
                                    primaryPhoneCodeController.text.trim()),
                                primaryPhone:
                                    primaryPhoneNumberController.text.trim(),
                                secondaryPhoneCode: int.parse(
                                    secondaryPhoneCodeController.text.trim()),
                                secondaryPhone:
                                    secondaryPhoneNumberController.text.trim(),
                                address: addressController.text.trim(),
                                country: selectedCountryId!,
                                state: selectedStateId!,
                              );

                              context
                                  .read<ContactBloc>()
                                  .add(PostContactEvent(contact));
                            } catch (e) {
                              showAnimatedError(context,
                                  "Invalid phone codes or missing values");
                            }
                          },
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
      ),
    );
  }
}
