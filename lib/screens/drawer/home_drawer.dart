import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/screens/drawer/drawer_item.dart';
import 'package:news/screens/drawer/selected_item.dart';
import 'package:news/utitis/app_colors.dart';
import 'package:news/utitis/app_styles.dart';
import 'package:news/utitis/context_extentions.dart';
import 'package:news/widgets/lang_options.dart';
import 'package:news/widgets/theme_options.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onHomeClick;
  HomeDrawer({super.key,required this.onHomeClick});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.readTheme;
    final languageProvider = context.watch<AppLanguageProvider>();
    return Column(
      spacing: context.h*0.02,
      children: [
        Container(
          height: context.h * 0.20,
          alignment: Alignment.center,
          color: AppColors.whiteColor,
          child: Text(
            'News App',
            style: AppStyles.bold24Black,
          ),
        ),
        InkWell(
          onTap: () {
            onHomeClick();
            Navigator.pop(context);
          },
          child: DrawerItem(text: "Go To Home", icon: Icons.home_rounded)
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: context.w*0.04,
          endIndent: context.w*0.04,
        ),
        DrawerItem(text: "Theme", icon: Icons.format_paint_rounded),
       SelectedItem(
          text: context.watch<AppThemeProvider>().appTheme == ThemeMode.light
              ? "Light"
              : "Dark",
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => const ThemeOptionsSheet(),
            );
          },
        ),
         Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: context.w*0.04,
          endIndent: context.w*0.04,
        ),
        DrawerItem(text: "Language", icon: CupertinoIcons.globe,),
        SelectedItem(
          text: languageProvider.currentLanguage.toUpperCase(),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => const LanguageOptionsSheet(),
            );
          },
        ),

      ],
    );
  }
}