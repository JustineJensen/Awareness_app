import 'package:flutter/material.dart';

class PrivacyLessonScreen extends StatelessWidget {
  const PrivacyLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Privacy'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'In this lesson, you will learn about digital privacy, including how to protect your personal information online, understand privacy settings on social media, and recognize the importance of data encryption.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}