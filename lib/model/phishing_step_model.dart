enum PhishingStepType {
  tip,
  scenario,
  summary,
}

class ScenarioOption {
  final String text;
  final bool isCorrect;
  final String feedback;

  const ScenarioOption({
    required this.text,
    required this.isCorrect,
    required this.feedback,
  });
}

class PhishingStepModel {
  final String id;
  final String moduleId;
  final int lessonIndex;
  final int totalLessons;
  final String title;
  final String badgeText;
  final String sectionTitle;
  final PhishingStepType type;

  final List<String>? points;

  final String? scenarioEmail;
  final List<ScenarioOption>? options;

  const PhishingStepModel({
    required this.id,
    required this.moduleId,
    required this.lessonIndex,
    required this.totalLessons,
    required this.title,
    required this.badgeText,
    required this.sectionTitle,
    required this.type,
    this.points,
    this.scenarioEmail,
    this.options,
  });

  double get progress {
    if (totalLessons == 0) return 0.0;
    return lessonIndex / totalLessons;
  }
}