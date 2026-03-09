import 'package:security_awareness_app/model/lesson_model.dart';

class LessonController {
  LessonModel getPhishingLesson1() {
    return const LessonModel(
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
  }

  LessonModel getPasswordLesson1() {
    return const LessonModel(
      id: 'password_1',
      moduleId: 'password_security',
      title: 'Why Password Security Matters',
      badgeText: 'Learning Tip',
      sectionTitle: 'Building Strong Password Habits',
      lessonIndex: 1,
      totalLessons: 3,
      points: [
        'Strong passwords help protect your personal and work accounts',
        'Weak passwords are easier for attackers to guess or crack',
        'Using the same password everywhere increases risk',
        'Password managers can help create and store secure passwords',
      ],
    );
  }

  LessonModel getPrivacyLesson1() {
    return const LessonModel(
      id: 'privacy_1',
      moduleId: 'digital_privacy',
      title: 'What is Digital Privacy?',
      badgeText: 'Learning Tip',
      sectionTitle: 'Understanding Digital Privacy',
      lessonIndex: 1,
      totalLessons: 3,
      points: [
        'Digital privacy is about controlling your personal information online',
        'Apps and websites may collect data about your behavior',
        'Sharing too much information can increase security risks',
        'Privacy settings help reduce unnecessary exposure',
      ],
    );
  }

  LessonModel getEmailSafetyLesson1() {
    return const LessonModel(
      id: 'email_1',
      moduleId: 'email_safety',
      title: 'How to Stay Safe with Email',
      badgeText: 'Learning Tip',
      sectionTitle: 'Email Safety Basics',
      lessonIndex: 1,
      totalLessons: 3,
      points: [
        'Do not open suspicious attachments or unknown links',
        'Check sender addresses carefully before responding',
        'Be cautious of urgent or threatening messages',
        'Report suspicious emails instead of interacting with them',
      ],
    );
  }
  LessonModel getLessonById(String lessonId) {
    switch (lessonId) {
      case 'phishing_1':
        return getPhishingLesson1();
      case 'password_1':
        return getPasswordLesson1();
      case 'privacy_1':
        return getPrivacyLesson1();
      case 'email_1':
        return getEmailSafetyLesson1();
      default:
        throw Exception('Lesson not found');
    }
  }
  LessonModel getLessonByModuleAndIndex(String moduleId, int lessonIndex) {
    if (moduleId == 'phishing_detection') {
      if (lessonIndex == 1) return getPhishingLesson1();
    } else if (moduleId == 'password_security') {
      if (lessonIndex == 1) return getPasswordLesson1();
    } else if (moduleId == 'digital_privacy') {
      if (lessonIndex == 1) return getPrivacyLesson1();
    } else if (moduleId == 'email_safety') {
      if (lessonIndex == 1) return getEmailSafetyLesson1();
    }
    throw Exception('Lesson not found for module $moduleId and index $lessonIndex');
  }
  LessonModel getLessonByModuleId(String moduleId) {
    switch (moduleId) {
      case 'phishing_detection':
        return getPhishingLesson1();

      case 'password_security':
        return getPasswordLesson1();

      case 'digital_privacy':
        return getPrivacyLesson1();

      case 'email_safety':
        return getEmailSafetyLesson1();

      default:
        throw Exception('Lesson not found for moduleId: $moduleId');
    }
  }

}