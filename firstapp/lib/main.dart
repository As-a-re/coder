import 'package:flutter/material.dart';

import 'landing_page.dart';
import 'login_screen.dart';
import 'splash_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'help_feedback_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';
import 'topic_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrueWord',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/landing': (context) => const LandingPage(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/history': (context) => const HistoryScreen(),
        '/help_feedback': (context) => const HelpFeedbackScreen(),
        '/topic_details': (context) => TopicDetailsScreen(topic: '',),
      },
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        );
      },
    );
  }
}