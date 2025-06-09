import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = "English (Default)";
  final List<String> languages = [
    "English (Default)",
    "हिंदी (Hindi)",
    "മലയാളം (Malayalam)",
    "தமிழ் (Tamil)",
    "తెలుగు (Telugu)",
    "ಕನ್ನಡ (Kannada)",
    "বাংলা (Bengali)",
    "मराठी (Marathi)",
    "(Arabic) العربية",
    "中文 (Chinese)",
    "Español (Spanish)",
    "Français (French)",
    "Deutsch (German)",
    "日本語 (Japanese)",
    "Русский (Russian)",
    "Português (Portuguese)",
    "অসমীয়া (Assamese)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.arrowbackIcon),
        ),
        title: Text(
          "Languages",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.separated(
            itemCount: languages.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: AppColors.white, // Divider color
            ),
            itemBuilder: (context, index) {
              return RadioListTile<String>(
                title: Text(languages[index]),
                value: languages[index],
                groupValue: selectedLanguage,
                activeColor: Colors.teal,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
