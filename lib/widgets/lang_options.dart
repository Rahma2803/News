import 'package:flutter/material.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/utitis/app_colors.dart';
import 'package:provider/provider.dart';

class LanguageOptionsSheet extends StatelessWidget {
  const LanguageOptionsSheet({super.key});

  final Map<String, String> languages = const {
    "en": "English",
    "ar": "Arabic",
    "de": "German",
    "fr": "French",
    "es": "Spanish",
    "it": "Italian",
    "ru": "Russian",
    "pt": "Portuguese",
    "zh": "Chinese",
    "nl": "Dutch",
  };

  @override
Widget build(BuildContext context) {
  final languageProvider = context.watch<AppLanguageProvider>();

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: languages.entries.map((entry) {
          return RadioListTile<String>(
            activeColor: AppColors.blackColor,
            value: entry.key,
            groupValue: languageProvider.currentLanguage,
            title: Text(entry.value),
            onChanged: (value) {
              if (value != null) {
                context
                    .read<AppLanguageProvider>()
                    .changeLanguage(value);
                Navigator.pop(context);
              }
            },
          );
        }).toList(),
      ),
    ),
  );
}
}
