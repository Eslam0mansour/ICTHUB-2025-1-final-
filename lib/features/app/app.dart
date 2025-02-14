import 'package:flutter/material.dart';
import 'package:ict_final/core/di/di.dart';
import 'package:ict_final/core/utils/shared_pref.dart';
import 'package:ict_final/features/home_nav/screens/home_nav_screen.dart';
import 'package:ict_final/features/login/login_screen.dart';

class FinalProject extends StatelessWidget {
  const FinalProject({super.key});

  @override
  Widget build(BuildContext context) {
    final haveToken = locator<MySharedPrefInterface>().isHaveToken();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: haveToken ? BottomNavLayout() : LoginScreen(),
    );
  }
}
