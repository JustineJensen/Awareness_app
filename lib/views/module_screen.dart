import 'package:flutter/material.dart';

class ModulesScreen extends StatefulWidget {
  const ModulesScreen({super.key});

  @override
  State<ModulesScreen> createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  final List<String> categories = const [
    'Information Security',
    'Cybersecurity Fundamentals',
    'AI Awareness',
    'Ethics & Legal',
  ];

  String selectedCategory = 'Information Security';

  final Map<String, List<String>> modulesByCategory = const {
    'Information Security': [
      'Password Hygiene',
      'Phishing Awareness',
      'What Information to Protect',
      'Email Security & Ransomware',
      'Social Engineering',
      'Safe Surfing Practices',
    ],
    'Cybersecurity Fundamentals': [
      'What is Cybersecurity?',
      'CIA Triad (Confidentiality, Integrity, Availability)',
      'Threats vs Vulnerabilities vs Risks',
    ],
    'AI Awareness': [
      'AI-Generated Phishing',
      'Deepfakes & Voice Scams',
      'AI & Misinformation',
      'AI Privacy Risks',
    ],
    'Ethics & Legal': [
      'Ethical Digital Behavior',
      'GDPR Basics',
      'Consent & Data Responsibility',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final modules = modulesByCategory[selectedCategory] ?? const [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Modules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose a category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            // Dropdown
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() => selectedCategory = value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              selectedCategory,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Module list
            Expanded(
              child: ListView.separated(
                itemCount: modules.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final title = modules[index];
                  return Card(
                    child: ListTile(
                      title: Text(title),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Later: navigate to lesson screen
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Open module: $title')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}