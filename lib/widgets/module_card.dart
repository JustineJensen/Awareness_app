import 'package:flutter/material.dart';
import 'package:security_awareness_app/core/contains.dart';
import '../model/module_model.dart';

class ModuleCard extends StatelessWidget {
  final ModuleModel module;
  final VoidCallback onTap;

  const ModuleCard({
    super.key,
    required this.module,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: module.iconBackground,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(module.icon, color: Colors.white),
            ),
            const SizedBox(height: 14),
            Text(
              module.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              module.description,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Progress',
                  style: TextStyle(fontSize: 13, color: AppColors.textMuted),
                ),
                Text(
                  '${(module.progress * 100).round()}%',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: module.progress,
                minHeight: 6,
                backgroundColor: AppColors.progressBg,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${module.completedLessons} of ${module.totalLessons} lessons',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}