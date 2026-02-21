import 'package:flutter/material.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';


extension ScreenSize on BuildContext {
  double get w => MediaQuery.sizeOf(this).width;
  double get h => MediaQuery.sizeOf(this).height;
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => theme.brightness == Brightness.dark;
  AppThemeProvider get watchTheme =>watch<AppThemeProvider>();
  AppThemeProvider get readTheme =>read<AppThemeProvider>();
}