import 'package:flutter/material.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  String _routeForCategory(String category) {
    switch (category) {
      case 'Protecting Your Personal Information':
        return '/modules/infosec';
      case 'Staying Safe Online':
        return '/modules/cyber';
      case 'Understanding AI Risks':
        return '/modules/ai';
      case 'Your Rights & Responsibilities Online':
        return '/modules/ethics';
      default:
        return '/modules';
    }
  }

  @override
  Widget build(BuildContext context) {
    final cards = const <_SimpleCardData>[
      _SimpleCardData(
        title: 'Protecting Your Personal Information',
        subtitle: 'Learn how to protect passwords, emails and personal data.',
      ),
      _SimpleCardData(
        title: 'Staying Safe Online',
        subtitle: 'Recognize phishing, scams and dangerous websites.',
      ),
      _SimpleCardData(
        title: 'Understanding AI Risks',
        subtitle: 'Learn about deepfakes, AI scams and misinformation.',
      ),
      _SimpleCardData(
        title: 'Your Rights & Responsibilities Online',
        subtitle: 'Understand privacy, ethics and legal issues online.',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Learning Path',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: cards.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final item = cards[i];
              return _SimpleCategoryCard(
                title: item.title,
                subtitle: item.subtitle,
                onTap: () {
                  final route = _routeForCategory(item.title);
                  Navigator.pushNamed(context, route);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SimpleCardData {
  final String title;
  final String subtitle;

  const _SimpleCardData({
    required this.title,
    required this.subtitle,
  });
}

class _SimpleCategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SimpleCategoryCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE6ECFF)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F5FF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE6ECFF)),
                ),
                child: const Icon(Icons.copy_all_outlined, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}