import 'package:flutter/material.dart';
import 'package:security_awareness_app/core/contains.dart';

class LessonContentCard extends StatelessWidget {
  final String sectionTitle;
  final List<String> points;

  const LessonContentCard({
    super.key,
    required this.sectionTitle,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.blue,
                ),
                child: const Icon(Icons.lightbulb_outline, color: Colors.white),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  sectionTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFF2563FF),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      point,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.textMuted,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}