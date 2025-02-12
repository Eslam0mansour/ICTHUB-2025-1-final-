import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/utils/bloc_observer.dart';

import 'features/home_nav/screens/home_nav_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(FinalProject());
}

class FinalProject extends StatelessWidget {
  const FinalProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavLayout(),
    );
  }
}
