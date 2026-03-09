import 'package:flutter/material.dart';
import 'package:security_awareness_app/model/model_item.dart';

class InfoModuleItems {
  static const List<ModuleItemModel> items = [
    ModuleItemModel(
      id: 'phishing_detection',
      title: 'Phishing Detection',
      subtitle: 'Learn to identify and avoid phishing attacks',
      route: '/lesson',
      color: Color(0xFFFF5A36),
      icon: Icons.phishing_outlined,
    ),
    ModuleItemModel(
      id: 'password_security',
      title: 'Password Security',
      subtitle: 'Create and manage strong, secure passwords',
      route: '/lesson',
      color: Color(0xFF1DA1F2),
      icon: Icons.lock_outline,
    ),
    ModuleItemModel(
      id: 'digital_privacy',
      title: 'Digital Privacy',
      subtitle: 'Protect your personal information online',
      route: '/lesson',
      color: Color(0xFF22C55E),
      icon: Icons.shield_outlined,
    ),
    ModuleItemModel(
      id: 'email_safety',
      title: 'Email Safety',
      subtitle: 'Secure your email communications',
      route: '/lesson',
      color: Color(0xFFD946EF),
      icon: Icons.mail_outline,
    ),
  ];
}