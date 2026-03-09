import 'lesson_model.dart';

class InfoLessons {

  static const LessonModel phishingLesson = LessonModel(
    id: 'phishing_1',
    moduleId: 'phishing_detection',
    title: 'What is Phishing?',
    badgeText: 'Learning Tip',
    sectionTitle: 'Understanding Phishing',
    lessonIndex: 1,
    totalLessons: 3,
    points: [
      'Phishing is a fraudulent attempt to obtain sensitive information',
      'Attackers disguise themselves as trustworthy entities',
      'Common targets: passwords, credit card numbers, personal data',
      'Delivered via email, text, or fake websites',
    ],
  );

  static const LessonModel passwordLesson = LessonModel(
    id: 'password_1',
    moduleId: 'password_security',
    title: 'Strong Password Basics',
    badgeText: 'Learning Tip',
    sectionTitle: 'Building Strong Passwords',
    lessonIndex: 1,
    totalLessons: 3,
    points: [
      'Use at least 12 characters',
      'Mix uppercase, lowercase, numbers, and symbols',
      'Avoid common words and personal information',
      'Use a unique password for each account',
      'Consider using a password manager',
    ],
  );

  static const LessonModel privacyLesson = LessonModel(
    id: 'privacy_1',
    moduleId: 'digital_privacy',
    title: 'Protecting Your Privacy',
    badgeText: 'Learning Tip',
    sectionTitle: 'Digital Privacy Essentials',
    lessonIndex: 1,
    totalLessons: 3,
    points: [
      'Avoid oversharing personal information online',
      'Review app permissions before granting access',
      'Use privacy settings on social media platforms',
      'Be cautious when using public Wi-Fi',
    ],
  );

  static const LessonModel emailLesson = LessonModel(
    id: 'email_1',
    moduleId: 'email_safety',
    title: 'Email Safety Basics',
    badgeText: 'Learning Tip',
    sectionTitle: 'Staying Safe in Email',
    lessonIndex: 1,
    totalLessons: 3,
    points: [
      'Check sender addresses carefully',
      'Do not open unexpected attachments',
      'Avoid clicking suspicious links',
      'Report suspicious emails to your organization',
    ],
  );
}