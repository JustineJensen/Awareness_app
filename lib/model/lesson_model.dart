class LessonModel {
  final String id;
  final String moduleId;
  final String title;
  final String badgeText;
  final String sectionTitle;
  final int lessonIndex;
  final int totalLessons;
  final List<String> points;

  const LessonModel({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.badgeText,
    required this.sectionTitle,
    required this.lessonIndex,
    required this.totalLessons,
    required this.points,
  });

  double get progress {
    if (totalLessons == 0) return 0.0;
    return lessonIndex / totalLessons;
  }
}