import 'package:flutter/material.dart';
import 'package:security_awareness_app/core/contains.dart';
import 'package:security_awareness_app/model/category_model.dart';
import 'package:security_awareness_app/model/module_model.dart';

class ModuleController {
  List<CategoryModel> getCategories() {
    return const [
      CategoryModel(
        id: 'information_security',
        title: 'Information Security',
        subtitle: 'Protect your personal data and online identity',
        icon: Icons.shield_outlined,
        gradient: AppGradients.info,
        moduleCount: 4,
      ),
      CategoryModel(
        id: 'cybersecurity',
        title: 'Cybersecurity',
        subtitle: 'Defend against digital threats and attacks',
        icon: Icons.verified_user_outlined,
        gradient: AppGradients.cyber,
        moduleCount: 6,
      ),
      CategoryModel(
        id: 'ethics_legal',
        title: 'Ethics & Legal',
        subtitle: 'Understand your rights and responsibilities',
        icon: Icons.balance_outlined,
        gradient: AppGradients.ethics,
        moduleCount: 7,
      ),
    ];
  }

  List<ModuleModel> getModulesByCategory(String categoryId) {
    const allModules = <ModuleModel>[
      ModuleModel(
        id: 'phishing_detection',
        categoryId: 'information_security',
        title: 'Phishing Detection',
        description: 'Learn to identify and avoid phishing attacks',
        icon: Icons.phishing_outlined,
        iconBackground: Color(0xFFFF5A36),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'password_security',
        categoryId: 'information_security',
        title: 'Password Security',
        description: 'Create and manage strong, secure passwords',
        icon: Icons.lock_outline,
        iconBackground: Color(0xFF1DA1F2),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'digital_privacy',
        categoryId: 'information_security',
        title: 'Digital Privacy',
        description: 'Protect your personal information online',
        icon: Icons.shield_outlined,
        iconBackground: Color(0xFF22C55E),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'email_safety',
        categoryId: 'information_security',
        title: 'Email Safety',
        description: 'Secure your email communications',
        icon: Icons.mail_outline,
        iconBackground: Color(0xFFD946EF),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'cybersecurity_fundamentals',
        categoryId: 'cybersecurity',
        title: 'Cybersecurity Fundamentals',
        description: 'Understand the core concepts of cybersecurity',
        icon: Icons.gpp_good_outlined,
        iconBackground: Color(0xFF5B6CFF),
        totalLessons: 2,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'cloud_specific_threats',
        categoryId: 'cybersecurity',
        title: 'Cloud-Specific Threats',
        description: 'Recognize and mitigate cloud security risks',
        icon: Icons.cloud_outlined,
        iconBackground: Color(0xFF11B5D9),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'device_network_security',
        categoryId: 'cybersecurity',
        title: 'Device & Network Security',
        description: 'Secure your devices and home network',
        icon: Icons.smartphone_outlined,
        iconBackground: Color(0xFF8B5CF6),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'incident_response',
        categoryId: 'cybersecurity',
        title: 'Incident Response for Users',
        description: 'Know what to do when security incidents occur',
        icon: Icons.warning_amber_outlined,
        iconBackground: Color(0xFFF43F5E),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'emerging_threats',
        categoryId: 'cybersecurity',
        title: 'Emerging Threats & Trends',
        description: 'Stay ahead of evolving cyber risks',
        icon: Icons.trending_up,
        iconBackground: Color(0xFFFF6B00),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'secure_collaboration',
        categoryId: 'cybersecurity',
        title: 'Secure Collaboration',
        description: 'Safe sharing and teamwork in cloud tools',
        icon: Icons.groups_outlined,
        iconBackground: Color(0xFF10B981),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'digital_ethics',
        categoryId: 'ethics_legal',
        title: 'Digital Ethics',
        description: 'Learn responsible and ethical online behavior',
        icon: Icons.favorite_border,
        iconBackground: Color(0xFFF2A900),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'ethical_data_handling',
        categoryId: 'ethics_legal',
        title: 'Ethical Data Handling',
        description: 'Principles of ethical data use and fairness',
        icon: Icons.balance_outlined,
        iconBackground: Color(0xFF5B6CFF),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'user_consent_rights',
        categoryId: 'ethics_legal',
        title: 'User Consent & Rights',
        description: 'Understanding consent and data rights',
        icon: Icons.assignment_outlined,
        iconBackground: Color(0xFF14B8A6),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'privacy_laws',
        categoryId: 'ethics_legal',
        title: 'Legal Frameworks for Privacy',
        description: 'Key privacy laws and what they mean for you',
        icon: Icons.menu_book_outlined,
        iconBackground: Color(0xFFD946EF),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'ai_ethics_security',
        categoryId: 'ethics_legal',
        title: 'AI Ethics in Security',
        description: 'Understanding AI\'s role and ethical implications',
        icon: Icons.work_outline,
        iconBackground: Color(0xFFF43F5E),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'liability_compliance',
        categoryId: 'ethics_legal',
        title: 'Liability & Compliance',
        description: 'Legal responsibilities in digital interactions',
        icon: Icons.gavel_outlined,
        iconBackground: Color(0xFFFF8A00),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
      ModuleModel(
        id: 'responsible_ai_use',
        categoryId: 'ethics_legal',
        title: 'Responsible AI Use',
        description: 'Use AI systems fairly, safely, and transparently',
        icon: Icons.psychology_outlined,
        iconBackground: Color(0xFF06B6D4),
        totalLessons: 3,
        completedLessons: 0,
        routeName: '/lesson',
      ),
    ];

    return allModules.where((module) => module.categoryId == categoryId).toList();
  }

  int getTotalModules() {
    return getCategories().fold(0, (sum, category) => sum + category.moduleCount);
  }

  int getCompletedModules() {
    final categories = getCategories();
    int completed = 0;

    for (final category in categories) {
      completed += getModulesByCategory(category.id)
          .where((module) => module.completedLessons == module.totalLessons)
          .length;
    }

    return completed;
  }

  int getTotalLessons() {
    final categories = getCategories();
    int total = 0;

    for (final category in categories) {
      total += getModulesByCategory(category.id)
          .fold(0, (sum, module) => sum + module.totalLessons);
    }

    return total;
  }

  CategoryModel getCategoryById(String id) {
    return getCategories().firstWhere((category) => category.id == id);
  }
}