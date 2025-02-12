import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/features/counter/cubit/counter_cubit.dart';
import 'package:ict_final/features/logout/logout_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Counter Screen"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        iconSize: 45,
                        onPressed: () {
                          context.read<CounterCubit>().decrementCounter();
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text("$state", style: TextStyle(fontSize: 45)),
                      IconButton(
                        iconSize: 45,
                        onPressed: () {
                          context.read<CounterCubit>().incrementCounter();
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  LogoutWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
