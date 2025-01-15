import 'package:flutter/material.dart';

class Category {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
  final Color color;

  const Category({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': icon.codePoint,
      'route': route,
      'color': color.value,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
      route: map['route'] as String,
      color: Color(map['color'] as int),
    );
  }
}