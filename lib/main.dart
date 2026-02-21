import 'package:flutter/material.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/search_screen.dart';
import 'package:news/utitis/app_routes.dart';
import 'package:news/utitis/app_theme.dart';
import 'package:news/utitis/context_extentions.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppThemeProvider()),
      ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
    ],
    child: const MyApp(),
   ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName : (BuildContext context) => HomeScreen(),
        AppRoutes.searchRouteName : (BuildContext context) => SearchScreen(),

      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watchTheme.appTheme,
    );
  }
}

