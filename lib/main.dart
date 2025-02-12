import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/utils/bloc_observer.dart';
import 'package:ict_final/features/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static Future<SharedPreferences> get preferences async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}

void main() async {
  Bloc.observer = MyBlocObserver();
  runApp(FinalProject());
}

class FinalProject extends StatefulWidget {
  const FinalProject({super.key});

  @override
  State<FinalProject> createState() => _FinalProjectState();
}

class _FinalProjectState extends State<FinalProject> {
  bool? haveToken;

  Future<bool> isHaveToken() async {
    final preferences = await MySharedPreferences.preferences;
    final token = preferences.getString('token');

    final isHaveToken = (token != null || token != '');
    return isHaveToken;
  }

  @override
  void initState() {
    super.initState();
    isHaveToken().then((value) {
      setState(() {
        haveToken = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: haveToken == null
          ? Scaffold()
          : haveToken!
              ? LoginScreen()
              : LoginScreen(),
    );
  }
}
