import 'package:flutter/material.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/utitis/app_colors.dart';
import 'package:provider/provider.dart';

class ThemeOptionsSheet extends StatelessWidget {
  const ThemeOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [ThemeMode.light, ThemeMode.dark].map((mode) {
            return RadioListTile<ThemeMode>(
              activeColor: AppColors.blackColor,
              value: mode,
              groupValue: themeProvider.appTheme,
              title: Text(
                mode == ThemeMode.light ? "Light" : "Dark",
              ),
              onChanged: (value) {
                if (value != null) {
                  context.read<AppThemeProvider>().changeTheme(value);
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
