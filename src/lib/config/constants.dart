import 'package:flutter/material.dart';

class AppConstants {
  // Textos de la aplicación
  static const appTitle = 'Cookbook Flutter';
  static const appVersion = '2.0.0';
  static const developerName = 'Alejandro Alonso Arellano Madrigal';
  static const developerRole = 'TSU Desarrollo de Software Multiplataforma';
  
  // Categorías
  static const categories = [
    {
      'title': 'Diseño',
      'icon': Icons.design_services,
      'subtitle': 'Ejemplos de diseño de interfaz',
      'route': '/design',
      'color': Colors.blue
    },
    {
      'title': 'Formularios',
      'icon': Icons.edit_document,
      'subtitle': 'Ejemplos de formularios',
      'route': '/forms',
      'color': Colors.green
    },
    {
      'title': 'Imágenes',
      'icon': Icons.image,
      'subtitle': 'Manejo de imágenes',
      'route': '/images',
      'color': Colors.purple
    },
    {
      'title': 'Listas',
      'icon': Icons.list,
      'subtitle': 'Ejemplos de listas',
      'route': '/lists',
      'color': Colors.orange
    },
    {
      'title': 'Navegación',
      'icon': Icons.navigation,
      'subtitle': 'Ejemplos de navegación',
      'route': '/navigation',
      'color': Colors.red
    },
  ];

  static var home;
}