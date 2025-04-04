import 'package:flutter/material.dart';
import 'login_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
          title: const Text('History'),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 10, // Example item count
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text('History Item ${index + 1}'),
                subtitle: Text('Details about history item ${index + 1}'),
                leading: const Icon(Icons.history),
              ),
            );
          },
        ),
      ),
    );
  }
}