import 'package:flutter/material.dart';
import 'package:cookbookarellano/config/theme.dart';
import 'package:cookbookarellano/config/routes.dart';
import 'package:cookbookarellano/config/constants.dart';
import 'package:cookbookarellano/screens/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getLightTheme(context),
      darkTheme: AppTheme.getDarkTheme(context),
      themeMode: ThemeMode.system,
      initialRoute: AppConstants.home,
      routes: AppRoutes.getRoutes(),
      onUnknownRoute: AppRoutes.onGenerateRoute,
      locale: const Locale('es', 'MX'),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
              scrollbars: true,
            ),
            child: child!,
          ),
        );
      },
      home: Builder(
        builder: (context) => const HomePage(),
      ),
    );
  }
}