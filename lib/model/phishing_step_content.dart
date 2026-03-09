
import 'package:security_awareness_app/model/phishing_step_model.dart';

class PhishingSteps {
  static const List<PhishingStepModel> steps = [
    PhishingStepModel(
      id: 'phishing_1',
      moduleId: 'phishing_detection',
      lessonIndex: 1,
      totalLessons: 3,
      title: 'What is Phishing?',
      badgeText: 'Learning Tip',
      sectionTitle: 'Understanding Phishing',
      type: PhishingStepType.tip,
      points: [
        'Phishing is a fraudulent attempt to obtain sensitive information',
        'Attackers disguise themselves as trustworthy entities',
        'Common targets: passwords, credit card numbers, personal data',
        'Delivered via email, text, or fake websites',
      ],
    ),
    PhishingStepModel(
      id: 'phishing_2',
      moduleId: 'phishing_detection',
      lessonIndex: 2,
      totalLessons: 3,
      title: 'Spot the Phishing Email',
      badgeText: 'Interactive Scenario',
      sectionTitle: 'Choose your response',
      type: PhishingStepType.scenario,
      scenarioEmail:
          '''Subject: URGENT - Your account will be suspended!

Dear Customer,

We have detected unusual activity on your account. Please click the link below to verify your identity within 24 hours or your account will be permanently suspended.

Verify Now: http://paypa1-verify.com/login

Thank you,
PayPal Security Team''',
      options: [
        ScenarioOption(
          text: 'Click the link to verify',
          isCorrect: false,
          feedback:
              'Incorrect. You should never click suspicious links in urgent emails.',
        ),
        ScenarioOption(
          text: 'Ignore and delete the email',
          isCorrect: true,
          feedback:
              'Correct! This is a phishing email. Notice the suspicious domain, urgent language, and generic greeting. Always verify directly with the company.',
        ),
        ScenarioOption(
          text: 'Reply with your information',
          isCorrect: false,
          feedback:
              'Incorrect. Never reply with personal or account information to suspicious emails.',
        ),
      ],
    ),
    PhishingStepModel(
      id: 'phishing_3',
      moduleId: 'phishing_detection',
      lessonIndex: 3,
      totalLessons: 3,
      title: 'Warning Signs',
      badgeText: 'Learning Tip',
      sectionTitle: 'Warning Signs',
      type: PhishingStepType.summary,
      points: [
        'Urgent or threatening language',
        'Generic greetings like "Dear Customer"',
        'Suspicious sender email addresses',
        'Misspelled URLs or company names',
        'Requests for personal information',
        'Poor grammar and spelling errors',
      ],
    ),
  ];
}