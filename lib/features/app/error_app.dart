import 'package:flutter/material.dart';

class ErrorMaterialApp extends StatelessWidget {
  final Object e;

  const ErrorMaterialApp({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Error: ${e.toString()}',
          ),
        ),
      ),
    );
  }
}
