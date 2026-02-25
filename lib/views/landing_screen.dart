import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to CloudZen',
              style: TextStyle(fontSize: 28, fontWeight:FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/login');
            }, 
            child:const Text('Sign In'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(onPressed: (){
              Navigator.pushNamed(context, '/register');
            }, child: const Text('Sign Up'),
            )
          ],
        )
      )

    );
  }
}