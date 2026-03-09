import 'package:flutter/material.dart';

class ModuleItemModel {
  final String id;
  final String title;
  final String subtitle;
  final String route;
  final Color color;
  final IconData icon;

  const ModuleItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.route,
    required this.color,
    required this.icon,
  });
}