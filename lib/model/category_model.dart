import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final LinearGradient gradient;
  final int moduleCount;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.moduleCount,
  });
}