import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:security_awareness_app/auth/auth_block.dart';
import 'package:security_awareness_app/views/landing_screen.dart';
import 'package:security_awareness_app/views/login_screen.dart';
import 'package:security_awareness_app/views/home_screen.dart';
import 'package:security_awareness_app/views/register_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
        title: 'CloudZen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/',
        routes: {
          '/': (_)=> const LandingScreen(),
          '/login': (_) => const LoginScreen(),
          '/home': (_) => const HomeScreen(),
          '/register': (_) => const RegisterScreen(),
        },
      ),
    );
  }
}

