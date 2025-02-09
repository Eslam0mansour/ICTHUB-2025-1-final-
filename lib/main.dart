import 'package:flutter/material.dart';
import 'package:ict_final/screens/counter_screen.dart';
import 'package:ict_final/screens/home_screen.dart';

void main() {
  runApp(FinalProject());
}

class FinalProject extends StatelessWidget {
  const FinalProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
