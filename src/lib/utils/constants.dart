import 'package:flutter/material.dart';
import '../models/category.dart';

class AppConstants {
  // App Information
  static const String appName = 'Cookbook Flutter';
  static const String appVersion = '2.0.0';
  static const String developerName = 'Alejandro Alonso Arellano Madrigal';
  static const String developerRole = 'TSU Desarrollo de Software Multiplataforma';

  // Categories
  static final List<Category> categories = [
    Category(
      title: 'Diseño',
      subtitle: 'Ejemplos de diseño de interfaz',
      icon: Icons.design_services,
      route: '/design',
      color: Colors.blue,
    ),
    Category(
      title: 'Formularios',
      subtitle: 'Ejemplos de formularios',
      icon: Icons.edit_document,
      route: '/forms',
      color: Colors.green,
    ),
    Category(
      title: 'Imágenes',
      subtitle: 'Manejo de imágenes',
      icon: Icons.image,
      route: '/images',
      color: Colors.purple,
    ),
    Category(
      title: 'Listas',
      subtitle: 'Ejemplos de listas',
      icon: Icons.list,
      route: '/lists',
      color: Colors.orange,
    ),
    Category(
      title: 'Navegación',
      subtitle: 'Ejemplos de navegación',
      icon: Icons.navigation,
      route: '/navigation',
      color: Colors.red,
    ),
  ];

  // Routes
  static const String home = '/';
  static const String design = '/design';
  static const String forms = '/forms';
  static const String images = '/images';
  static const String lists = '/lists';
  static const String navigation = '/navigation';
}