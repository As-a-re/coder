import 'package:flutter/material.dart';
import 'login_screen.dart';

class HelpFeedbackScreen extends StatelessWidget {
  const HelpFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Help & Feedback'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Help & Feedback',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'If you need assistance or have feedback, please contact us at:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 8),
                  Text('support@gmail.com'),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Feedback Form',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Feedback',
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Handle feedback submission
                },
                child: const Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}