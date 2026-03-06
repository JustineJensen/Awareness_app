import 'package:flutter/material.dart';
import 'package:security_awareness_app/model/info_lessons.dart';

class InfoLessonCard extends StatelessWidget {
  final InfoLessonCardData data;
  final VoidCallback onTap;

  const InfoLessonCard({
    super.key,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (data.progress * 100).round();

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE6ECFF)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(data.subtitle),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Text("Progress"),
                  const Spacer(),
                  Text("$pct%"),
                ],
              ),

              const SizedBox(height: 8),

              LinearProgressIndicator(
                value: data.progress,
                minHeight: 8,
              ),

              const SizedBox(height: 6),

              Text(
                "${data.completedLessons} of ${data.totalLessons} lessons",
              ),
            ],
          ),
        ),
      ),
    );
  }
}