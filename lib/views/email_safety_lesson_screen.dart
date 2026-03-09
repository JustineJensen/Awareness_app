import 'package:flutter/material.dart';

class EmailSafetyLessonScreen extends StatelessWidget {
  const EmailSafetyLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Safety'),
      ),
      body: const Center(
        child: Text('Email Safety Lesson Content Goes Here'),
      ),
    );
  }
}