import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:blended_learning_system/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
   static String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          children: [
            Image.asset('images/emblem.jpeg'),
            const Text(
              'Education App',
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      nextScreen: const WelcomePage(),
      splashIconSize: 185,
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
