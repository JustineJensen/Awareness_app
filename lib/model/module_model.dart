import 'package:flutter/material.dart';

class ModuleModel {
  final String id;
  final String categoryId;
  final String title;
  final String description;
  final IconData icon;
  final Color iconBackground;
  final int totalLessons;
  final int completedLessons;
  final String routeName;

  const ModuleModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBackground,
    required this.totalLessons,
    required this.completedLessons,
    required this.routeName,
  });

  double get progress {
    if (totalLessons == 0) return 0.0;
    return completedLessons / totalLessons;
  }
}