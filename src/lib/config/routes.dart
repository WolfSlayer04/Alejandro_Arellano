import 'package:flutter/material.dart';
import 'package:cookbookarellano/screens/home/home_page.dart';
import 'package:cookbookarellano/screens/design/design_page.dart';
import 'package:cookbookarellano/screens/forms/forms_page.dart';
import 'package:cookbookarellano/screens/images/images_page.dart';
import 'package:cookbookarellano/screens/lists/lists_page.dart';
import 'package:cookbookarellano/screens/navigation/navigation_page.dart';
import 'package:cookbookarellano/utils/constants.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      AppConstants.home: (context) => const HomePage(),
      AppConstants.design: (context) => const DesignPage(),
      AppConstants.forms: (context) => const FormsPage(),
      AppConstants.images: (context) => const ImagesPage(),
      AppConstants.lists: (context) => const ListsPage(),
      AppConstants.navigation: (context) => const NavigationPage(),
    };
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Página no encontrada'),
        ),
      ),
    );
  }
}