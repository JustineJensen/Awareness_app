import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:security_awareness_app/auth/auth_block.dart';
import 'package:security_awareness_app/firebase_options.dart';

import 'package:security_awareness_app/views/landing_screen.dart';
import 'package:security_awareness_app/views/login_screen.dart';
import 'package:security_awareness_app/views/register_screen.dart';
import 'package:security_awareness_app/views/home_screen.dart';
import 'package:security_awareness_app/views/module_screen.dart';
import 'package:security_awareness_app/views/information_sec_screen.dart';
import 'package:security_awareness_app/views/phishing_lesson_screen.dart';
import 'package:security_awareness_app/views/password_lesson_screen.dart';
import 'package:security_awareness_app/views/privacy_lesson_screen.dart';
import 'package:security_awareness_app/views/email_safety_lesson_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc()..add(AuthSubscribe()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CloudZen',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const LandingScreen(),
          '/login': (_) => const LoginScreen(),
          '/register': (_) => const RegisterScreen(),
          '/home': (_) => HomeScreen(),
          '/modules': (_) => const ModulesScreen(),
          '/modules/infosec': (_) => const InformationSecScreen(),
          '/lesson/phishing': (_) => const PhishingLessonScreen(),
          '/lesson/password': (_) => const PasswordLessonScreen(),
          '/lesson/privacy': (_) => const PrivacyLessonScreen(),
          '/lesson/emailsafety': (_) => const EmailSafetyLessonScreen(),
        },
      ),
    );
  }
}