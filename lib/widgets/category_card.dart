import 'package:flutter/material.dart';
import 'package:security_awareness_app/core/contains.dart';
import '../model/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;
  final double progress;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: category.gradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(category.icon, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: const TextStyle(
                      fontSize: 24 / 1.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category.subtitle,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '${category.moduleCount} modules',
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        '${(progress * 100).round()}% complete',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      backgroundColor: AppColors.progressBg,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}