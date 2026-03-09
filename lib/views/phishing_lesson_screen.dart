import 'package:flutter/material.dart';
import 'package:security_awareness_app/controller/lesson_controller.dart';

class PhishingLessonScreen extends StatelessWidget {
  const PhishingLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lesson = LessonController().getPhishingLesson1();
    final progressPercent = (lesson.progress * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 980),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 18, 28, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back, size: 18),
                              label: const Text('Back to Hub'),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF111827),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Lesson ${lesson.lessonIndex} of ${lesson.totalLessons}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Phishing Detection',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(999),
                                child: LinearProgressIndicator(
                                  value: lesson.progress.clamp(0.0, 1.0),
                                  minHeight: 8,
                                  backgroundColor: const Color(0xFFE5E7FF),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color(0xFF6366F1),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Text(
                              '$progressPercent%',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 1, thickness: 1, color: Color(0xFFE5EAF5)),

                  // Main content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                    child: Column(
                      children: [
                        Text(
                          lesson.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF111827),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF2FF),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.lightbulb_outline,
                                size: 18,
                                color: Color(0xFF2563EB),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Learning Tip',
                                style: TextStyle(
                                  color: Color(0xFF2563EB),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 26),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: const Color(0xFFE6ECFF)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 52,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF169BFF),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Icon(
                                      Icons.lightbulb_outline,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Understanding Phishing',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF111827),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 28),

                              ...lesson.points.map(
                                (point) => Padding(
                                  padding: const EdgeInsets.only(bottom: 22),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Icon(
                                          Icons.check_circle_outline,
                                          color: Color(0xFF2563EB),
                                          size: 22,
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Text(
                                          point,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            height: 1.5,
                                            color: Color(0xFF64748B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF2563EB),
                                  Color(0xFF0891B2),
                                ],
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {
                                // TODO: navigate to lesson 2
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}