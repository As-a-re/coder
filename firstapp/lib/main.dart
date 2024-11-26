import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Homepage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Homepage'),
    );
  }
}

class MyHomePage extends StatelessWidget {
            const MyHomePage ({super.key, required this.title});
            final String title;
            
              @override
              Widget build(BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Homepage'),),
                      body: Center(
                        child: Text(
                          'Welcome to the Homepage',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    );
              }
      }
      