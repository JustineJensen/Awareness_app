import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:security_awareness_app/model/module_model.dart';
import '../repositories/progress_repository.dart';

class ModulesScreen extends StatefulWidget {
  const ModulesScreen({super.key});

  @override
  State<ModulesScreen> createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  final _progressRepo = ProgressRepository();


  final List<ModuleModel> _modules = const [
    ModuleModel(
      id: 'infosec',
      title: 'Protecting Your Personal Information',
      subtitle: 'Learn how to protect passwords, emails and personal data.',
      modules: 4,
      route: '/modules/infosec',
    ),
    ModuleModel(
      id: 'cyber',
      title: 'Staying Safe Online',
      subtitle: 'Recognize phishing, scams and dangerous websites.',
      modules: 6,
      route: '/modules/cyber',
    ),
    ModuleModel(
      id: 'ai',
      title: 'Understanding AI Risks',
      subtitle: 'Learn about deepfakes, AI scams and misinformation.',
      modules: 5,
      route: '/modules/ai',
    ),
    ModuleModel(
      id: 'ethics',
      title: 'Your Rights & Responsibilities Online',
      subtitle: 'Understand privacy, ethics and legal issues online.',
      modules: 7,
      route: '/modules/ethics',
    ),
  ];

  late Future<Map<String, double>> _futureProgress;

  @override
  void initState() {
    super.initState();
    _futureProgress = _loadAllProgress();
  }

  Future<Map<String, double>> _loadAllProgress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return {};

    final Map<String, double> result = {};

    for (final m in _modules) {
      final p = await _progressRepo.getModuleProgress(user.uid, m.id);
      result[m.id] = p;
    }

    return result;
  }

  Future<void> _refresh() async {
    setState(() {
      _futureProgress = _loadAllProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Learning Path',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh progress',
          ),
        ],
      ),
      body: FutureBuilder<Map<String, double>>(
        future: _futureProgress,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading progress: ${snapshot.error}'),
            );
          }

          final progressMap = snapshot.data ?? {};

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: ListView.separated(
                padding: const EdgeInsets.all(18),
                itemCount: _modules.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final item = _modules[i];
                  final progress = progressMap[item.id] ?? 0.0;

                  return _SimpleCategoryCard(
                    title: item.title,
                    subtitle: item.subtitle,
                    progress: progress,
                    modules: item.modules,
                    onTap: () async {
                      await Navigator.pushNamed(context, item.route);
                      // refresh when coming back (so progress updates)
                      await _refresh();
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SimpleCategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final int modules;
  final VoidCallback onTap;

  const _SimpleCategoryCard({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.modules,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (progress * 100).round().clamp(0, 100);

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.circle, size: 8, color: Color(0xFF4F6BFF)),
                        const SizedBox(width: 6),
                        Text(
                          '$modules modules',
                          style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                        ),
                        const SizedBox(width: 14),
                        const Icon(Icons.circle, size: 8, color: Colors.green),
                        const SizedBox(width: 6),
                        Text(
                          '$pct% complete',
                          style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        minHeight: 8,
                        backgroundColor: const Color(0xFFEFF2FF),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF4F6BFF),
                        ),
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
                child: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}