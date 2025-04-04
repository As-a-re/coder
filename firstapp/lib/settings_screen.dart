import 'package:flutter/material.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  double fontSize = 16.0;

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
          title: const Text('Settings'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: darkMode,
                onChanged: (bool value) {
                  setState(() {
                    darkMode = value;
                    // Handle dark mode toggle
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Font Size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: fontSize,
                min: 12.0,
                max: 24.0,
                divisions: 6,
                label: fontSize.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    fontSize = value;
                    // Handle font size change
                  });
                },
              ),
              Text(
                'Sample Text',
                style: TextStyle(fontSize: fontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}