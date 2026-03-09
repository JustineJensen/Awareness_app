import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF2563FF);
  static const Color primaryCyan = Color(0xFF11B5D9);
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color textDark = Color(0xFF111827);
  static const Color textMuted = Color(0xFF64748B);
  static const Color border = Color(0xFFE5E7EB);
  static const Color progressBg = Color(0xFFE0E7FF);
}

class AppGradients {
  static const LinearGradient blue = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient info = LinearGradient(
    colors: [Color(0xFF4F7BFF), Color(0xFF5B5FF5)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient cyber = LinearGradient(
    colors: [Color(0xFF14B8A6), Color(0xFF0FB9B1)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient ethics = LinearGradient(
    colors: [Color(0xFFB24BF3), Color(0xFFF3388D)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}