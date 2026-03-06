import 'package:flutter/material.dart';

class InfoLessonCardData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBg;
  final double progress;
  final int completedLessons;
  final int totalLessons;

  const InfoLessonCardData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBg,
    required this.progress,
    required this.completedLessons,
    required this.totalLessons,
  });
}