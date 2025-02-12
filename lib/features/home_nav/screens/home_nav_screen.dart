import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/features/counter/screens/counter_screen.dart';
import 'package:ict_final/features/home/screens/home_screen.dart';
import 'package:ict_final/features/home_nav/cubit/bottom_nav_cubit.dart';

class BottomNavLayout extends StatelessWidget {
  BottomNavLayout({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    CounterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                context.read<BottomNavCubit>().changeIndex(index);
              },
              currentIndex: state,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calculate_outlined),
                  label: 'Counter',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
