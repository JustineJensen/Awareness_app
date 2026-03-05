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

  String _routeForCategory(String category) {
    switch (category) {
      case 'Information Security':
        return '/modules/infosec';
      case 'Cybersecurity Fundamentals':
        return '/modules/cyber';
      case 'AI Awareness':
        return '/modules/ai';
      case 'Ethics & Legal':
        return '/modules/ethics';
      default:
        return '/modules';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning Modules')),
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

            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() => selectedCategory = value);
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final route = _routeForCategory(selectedCategory);
                  Navigator.pushNamed(context, route);
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}