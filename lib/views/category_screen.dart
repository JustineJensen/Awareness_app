import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:security_awareness_app/model/learning_path_model.dart';
import '../repositories/progress_repository.dart';

class ModulesScreen extends StatefulWidget {
  const ModulesScreen({super.key});

  @override
  State<ModulesScreen> createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  final _progressRepo = ProgressRepository();

  final List<LearningPathModel> _modules = const [
    LearningPathModel(
      id: 'infosec',
      title: 'Protecting Your Personal Information',
      subtitle: 'Learn how to protect passwords, emails and personal data.',
      modules: 4,
      route: '/modules/infosec',
    ),
    LearningPathModel(
      id: 'cyber',
      title: 'Staying Safe Online',
      subtitle: 'Recognize phishing, scams and dangerous websites.',
      modules: 6,
      route: '/modules/cyber',
    ),
    LearningPathModel(
      id: 'ai',
      title: 'Understanding AI Risks',
      subtitle: 'Learn about deepfakes, AI scams and misinformation.',
      modules: 5,
      route: '/modules/ai',
    ),
    LearningPathModel(
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

  double _calculateOverallProgress(Map<String, double> progressMap) {
    if (_modules.isEmpty) return 0.0;

    double total = 0;
    for (final module in _modules) {
      total += progressMap[module.id] ?? 0.0;
    }

    return total / _modules.length;
  }

  int _getCompletedCount(Map<String, double> progressMap) {
    int completed = 0;
    for (final module in _modules) {
      final progress = progressMap[module.id] ?? 0.0;
      if (progress >= 1.0) {
        completed++;
      }
    }
    return completed;
  }

  int _getTotalLessons() {
    int total = 0;
    for (final module in _modules) {
      total += module.modules;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Your Learning Journey',
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
          final overallProgress = _calculateOverallProgress(progressMap);
          final overallPercent = (overallProgress * 100).round();
          final completedCount = _getCompletedCount(progressMap);
          final totalModules = _modules.length;
          final totalLessons = _getTotalLessons();

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: ListView(
                padding: const EdgeInsets.all(18),
                children: [
                  _JourneyHeaderCard(
                    overallPercent: overallPercent,
                    overallProgress: overallProgress,
                    completed: completedCount,
                    left: totalModules - completedCount,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          value: '$totalModules',
                          label: 'Total Modules',
                          valueColor: const Color(0xFF2563FF),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _StatCard(
                          value: '$completedCount',
                          label: 'Completed',
                          valueColor: const Color(0xFF16A34A),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _StatCard(
                          value: '$totalLessons',
                          label: 'Total Lessons',
                          valueColor: const Color(0xFFA855F7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ...List.generate(_modules.length, (i) {
                    final item = _modules[i];
                    final progress = progressMap[item.id] ?? 0.0;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _SimpleCategoryCard(
                        title: item.title,
                        subtitle: item.subtitle,
                        progress: progress,
                        modules: item.modules,
                        onTap: () async {
                          await Navigator.pushNamed(context, item.route);
                          await _refresh();
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _JourneyHeaderCard extends StatelessWidget {
  final int overallPercent;
  final double overallProgress;
  final int completed;
  final int left;

  const _JourneyHeaderCard({
    required this.overallPercent,
    required this.overallProgress,
    required this.completed,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2F80ED), Color(0xFF12B5D0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ),
              _MiniStatBubble(
                icon: Icons.emoji_events_outlined,
                value: '$completed Done',
              ),
              const SizedBox(width: 12),
              _MiniStatBubble(
                icon: Icons.adjust,
                value: '$left Left',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '$overallPercent%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Overall Progress',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: overallProgress.clamp(0.0, 1.0),
              minHeight: 6,
              backgroundColor: const Color(0x55FFFFFF),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStatBubble extends StatelessWidget {
  final IconData icon;
  final String value;

  const _MiniStatBubble({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;

  const _StatCard({
    required this.value,
    required this.label,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6ECFF)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 12,
            ),
          ),
        ],
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