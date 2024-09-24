import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const CWApplication4());
}

class CWApplication4 extends StatelessWidget {
  const CWApplication4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ingredients and Favorite dishes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}



