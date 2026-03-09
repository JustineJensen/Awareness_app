import 'package:flutter/material.dart';
import 'package:security_awareness_app/core/contains.dart';
import '../controller/lesson_controller.dart';
import '../widgets/gradient_button.dart';
import '../widgets/lesson_content_card.dart';

class LessonScreen extends StatelessWidget {
  LessonScreen({super.key});

  final LessonController lessonController = LessonController();

  @override
  Widget build(BuildContext context) {
    final String moduleId = ModalRoute.of(context)!.settings.arguments as String;
    final lesson = lessonController.getLessonByModuleId(moduleId);

    final progressPercent = (lesson.progress * 100).round();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
                      label: const Text(
                        'Back to Hub',
                        style: TextStyle(color: AppColors.textDark),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _moduleTitleFromId(moduleId),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textDark,
                          ),
                        ),
                        Text(
                          'Lesson ${lesson.lessonIndex} of ${lesson.totalLessons}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Text(
                          '$progressPercent%',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: lesson.progress,
                        minHeight: 6,
                        backgroundColor: AppColors.progressBg,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Text(
                            lesson.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 48 / 1.5,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.lightbulb_outline,
                                  size: 16,
                                  color: Color(0xFF2563FF),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  lesson.badgeText,
                                  style: const TextStyle(
                                    color: Color(0xFF2563FF),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56),
                    child: LessonContentCard(
                      sectionTitle: lesson.sectionTitle,
                      points: lesson.points,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56),
                    child: GradientButton(
                      text: 'Continue',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Next lesson flow can be added here.'),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _moduleTitleFromId(String moduleId) {
    switch (moduleId) {
      case 'phishing_detection':
        return 'Phishing Detection';
      case 'password_security':
        return 'Password Security';
      case 'digital_privacy':
        return 'Digital Privacy';
      case 'email_safety':
        return 'Email Safety';
      case 'cybersecurity_fundamentals':
        return 'Cybersecurity Fundamentals';
      case 'digital_ethics':
        return 'Digital Ethics';
      default:
        return 'Learning Module';
    }
  }
}